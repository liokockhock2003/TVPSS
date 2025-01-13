package com.controller;

import org.bytedeco.ffmpeg.avutil.AVFrame;
import org.bytedeco.ffmpeg.global.avcodec;
import org.bytedeco.ffmpeg.global.avformat;
import org.bytedeco.ffmpeg.global.avutil;
import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.bytedeco.javacv.Frame;
import org.bytedeco.javacv.Java2DFrameConverter;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class VideoThumbnailExtractor {

    public static void extractThumbnail(String videoPath, String thumbnailPath) throws IOException {
        FFmpegFrameGrabber frameGrabber = new FFmpegFrameGrabber(videoPath);
        try {
            frameGrabber.start();

            // Set the timestamp to capture the frame (e.g., 1 second into the video)
            frameGrabber.setTimestamp(1000000); // 1 second = 1,000,000 microseconds

            // Grab the frame
            Frame frame = frameGrabber.grabImage();
            if (frame != null) {
                // Convert the frame to a BufferedImage
                Java2DFrameConverter converter = new Java2DFrameConverter();
                BufferedImage image = converter.convert(frame);

                // Save the BufferedImage as a thumbnail
                File output = new File(thumbnailPath);
                ImageIO.write(image, "jpg", output);
            }

            frameGrabber.stop();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            frameGrabber.close();
        }
    }
    
    public static String getVideoDuration(String videoPath) {
        FFmpegFrameGrabber frameGrabber = null;
        try {
            avutil.av_log_set_level(avutil.AV_LOG_QUIET); // Suppress FFmpeg logs

            frameGrabber = new FFmpegFrameGrabber(videoPath);
            frameGrabber.start();

            // Duration in microseconds
            long durationInMicroseconds = frameGrabber.getLengthInTime();
            long durationInSeconds = durationInMicroseconds / 1_000_000; // Convert to seconds

            long hours = durationInSeconds / 3600;
            long minutes = (durationInSeconds % 3600) / 60;
            long seconds = durationInSeconds % 60;

            return String.format("%02d:%02d:%02d", hours, minutes, seconds);
        } catch (Exception e) {
            e.printStackTrace();
            return "00:00:00"; // Default duration in case of failure
        } finally {
            try {
                if (frameGrabber != null) {
                    frameGrabber.stop();
                    frameGrabber.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
