Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2338C29CB52
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 04:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789102542; cv=none; b=uqd4MDlTsePbmpRYVlVIzA4xHddlHrm7FZqvKNwKikrZjrW6lJzvjeZO7567hi5MISSk7RrxKn9e8BWXtJ/SncZYDoDS0AzUWQsm490ga6NHEQ1I1yjFSuLtKE/3NLxTB0vvq/DIipwOKabvsv+iz4IZv98BckzcOWrPUsjqf9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789102542; c=relaxed/simple;
	bh=gRax98XBnTeXsB4U3frQSfMdpqRTS/1n+vv0snGdib8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ob0yKeh3vh74mOctMdklfmHrxbjUvD0vwCST80vg8vfqOiH7WLjMy62Ug7iCDYV798ydmDO9YejGtz8W7l92PLhfHBLtntEg8xc2sEO6mSm+Xl0CS4o3kDa+gbQf+eEpq2Cx8Fc5mE8kGBddi70XdlxM9WMt5Wwqd7MYEnK/BV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcEkOOvf; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcEkOOvf"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7f18c0e03e3so324629a34.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 21:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789102540; x=1789707340; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jdcjf1BPsFMtJuMfKKBIV37SM+mo5KWOGPxwINTYozQ=;
        b=jcEkOOvfngPz/0Jw6Rx89VWcSezcF+GrSUv+YLoAOQvwfbJ6bFCaNUXS90aka7kHBl
         Nfg3RCy6ZySE8U44aez1GSSli787KuV00clMXWub62dPk6RHfXF43gfv9iNyLVBlZqow
         8RoM23NUUVntG+WwMArdmQtAm7iM8s6h8N3aY/I50MeCNb14gLDobzvW1u6oQ6y5y9+v
         zVy7SCBVPDw2JH1Z69FudeC4rMZ270k3pplbuwL8tUOIGcOX8r67oxfPehJ4epZbiyb9
         O+d19FZ+tcp6X5+2wnN7tpFQ4oErJJKaOJaptFDypcFjPYQ3uZGaED/VrGH2GqszyM4B
         MZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789102540; x=1789707340;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdcjf1BPsFMtJuMfKKBIV37SM+mo5KWOGPxwINTYozQ=;
        b=TvceQ+9JDumIe1jniVm5UapevgaqBbm2uDgnHipSwjFPd8p+fDkkVGuwBizCV/A4Qm
         dM42xP43MsKYI1cn15hr8lvOA/RsLrbjUe7kw9D5Z1QYTU7o8glzI36JIfh0eiVH8baX
         e1aiIEPNanDvg4Gh/7Efb2uGugCr1gbshPY4waDFXLr0QCZ2v/JdvcFTpw5eRgc4z7Nf
         vfARIQrHd5reR9NzqxXWGxlD+MbQpkLLlL3HD9GrZR8ZOLefyAae+aZ0ga/Iv1JS6Yxp
         eGhORA6hReB7kuyLUe561dDPGWPPP0XGFysNn4MeE6k9rzZVpP+bRNwxeK5G6lYkDhG/
         Etqw==
X-Gm-Message-State: AFuF++lTsyiskwVM9GY5GTwcylr6yM3alwlsmBpktH3UkhNTcsKyCeL9
	voglj4MG4cR3T7Wj4KINZExyZDgxKD7OjvelRo8uubdMHbKPUNFKb8ar
X-Gm-Gg: AYBFou3rHw7UxMxb4AZrcr2GIDqoe6AjW06ze8T9ArSSHLoSD8cUXYMeR0zgO+L3mOc
	xTic+G2b/3NaW8a3GNqJNRfRDFSuHFGESCcAmr4qlbvB/gUZTvIzwhuMADp4ngJUbalUiAG21Tf
	YJ5XB+egPEEwVWcv3vu39zONkyOoToT8myuz5ht3zTgBJz2SxKh+4gB3rdVzfOQm7lM8kFTHOTc
	fOy2o6Ycn78kJWu2EEpNBuOmSIoZYB5Z63LGL8GvlJ8vJSCwfTMaFn8f8rLJFPQep2TX8iq1q6b
	W0GfCjrs6c/qrDC5GfzJp9Y0LKa6jjEWSY4iTOulQdM8MtNUU3ydgNcLdxsZFtLAgIhA4XHeurz
	m6Gx+0guIJ3Qoj0n0Rh0ehRDFiV8gC+v+Ie1bgZZqndp3+mLsvMrQaWWzCMt2Fc3AlZlBWcR4M2
	yMYUAYDRuc9JiDJRpo+nikwCGHPp2TO7yiS6GtKfjrmwJb9smyQ4WrezV+uxssu8ukAG8TBrxcc
	4oFFCmFhWM83OEPmyrQx14BeSe5Qk8=
X-Received: by 2002:a05:6830:348e:b0:7e9:eb13:d042 with SMTP id 46e09a7af769-803ffb978a0mr1569459a34.8.1789102539986;
        Thu, 10 Sep 2026 21:55:39 -0700 (PDT)
Received: from dhoja (S01067483c248479d.wp.shawcable.net. [50.72.244.202])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f6d1875csm1484100a34.22.2026.09.10.21.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 21:55:39 -0700 (PDT)
Date: Thu, 10 Sep 2026 23:55:37 -0500
From: Curtis Vogt <curtis.vogt@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: sashiko-reviews@lists.linux.dev, linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com
Subject: Re: [PATCH 2/3] HID: valve-index: Reboot headset on system power
 transitions
Message-ID: <aqOJycOWtHP5DvLz@dhoja>
References: <20260910170254.833871-1-mario.limonciello@amd.com>
 <20260910170254.833871-3-mario.limonciello@amd.com>
 <20260910171756.57EEF1F00893@smtp.kernel.org>
 <0407d630-e1b1-4a20-8e05-b0d0946585ce@amd.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0407d630-e1b1-4a20-8e05-b0d0946585ce@amd.com>

On Thu, Sep 10, 2026 at 12:21:15PM -0500, Mario Limonciello wrote:
> 
> 
> On 9/10/26 12:17, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] Incorrect buffer formatting and report ID targeting in `hid_hw_raw_request` fallback for an unnumbered HID report.
> > --
> > 
> > commit 4526fbce2701e5a40089fba6ae186ded76bc0864
> > Author: Mario Limonciello <mario.limonciello@amd.com>
> > Subject: HID: valve-index: Reboot headset on system power transitions
> > 
> > This commit introduces a new HID driver for the Valve Index headset to
> > reboot it on system power transitions. It sends a specific 64-byte report
> > to recover the EDID service after a DisplayPort link shutdown.
> > 
> > Link: https://github.com/ValveSoftware/SteamVR-for-Linux/issues/939
> > 
> > > diff --git a/drivers/hid/hid-valve-index.c b/drivers/hid/hid-valve-index.c
> > > new file mode 100644
> > > --- /dev/null
> > > +++ b/drivers/hid/hid-valve-index.c
> > [ ... ]
> > > +static void valve_index_reboot(struct hid_device *hdev, bool wake)
> > > +{
> > > +	u8 *report;
> > > +	int ret;
> > > +
> > > +	if (!valve_index_has_reboot_report(hdev))
> > > +		return;
> > > +
> > > +	/* USB transfer buffers must be DMA-able, so not on the stack. */
> > > +	report = kzalloc(VALVE_INDEX_REPORT_SIZE, GFP_KERNEL);
> > > +	if (!report)
> > > +		return;
> > > +	report[0] = VALVE_INDEX_REBOOT_REPORT_ID;
> > 
> > [Severity: Medium]
> > Is the report buffer sized correctly for an unnumbered report fallback?
> > 
> > The HID core and usbhid transport expect unnumbered report buffers to be
> > prefixed with a dummy 0x00 byte (so payload size + 1) for control transfers.
> > Allocating exactly 64 bytes and placing the payload command at index 0 might
> > break control transfer formatting in usbhid_set_raw_report if the fallback
> > path below is taken.
> > 
> > [ ... ]
> > > +	/* Use the same interrupt-out then SET_REPORT fallback as hidraw. */
> > > +	ret = hid_hw_output_report(hdev, report, VALVE_INDEX_REPORT_SIZE);
> > > +	if (ret == -ENOSYS)
> > > +		ret = hid_hw_raw_request(hdev, report[0], report,
> > > +					 VALVE_INDEX_REPORT_SIZE,
> > > +					 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
> > 
> > [Severity: Medium]
> > Does this properly target the unnumbered report during the fallback?
> > 
> > By passing report[0] (which contains 0x16) as the reportnum argument, the
> > fallback control transfer will target Output Report ID 0x16 instead of the
> > required unnumbered report (ID 0). If hid_hw_output_report returns -ENOSYS
> > and this fallback is taken, the headset might reject the transfer, causing
> > the reboot command to fail.
> > 
> > > +	if (ret < 0)
> > > +		hid_warn(hdev, "failed to reboot headset: %d\n", ret);
> > [ ... ]
> > 
> 
> Curtis - can you check how the headset handles those cases?

I'll dig into this
