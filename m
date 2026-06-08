Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85877370D5F
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 11:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919454; cv=pass; b=YkwOl77x6APDOu1aVIDTvBqtLH3C2UiM8OTSJDK8ZvJvME3E2a37SI8jI9VRz6EBz3jfH5wkDGMWt8WgPm/podaFtugrUcf9GXnbx0MuDSTzelbXl0xcJZeDqMEnuOtpubFCfv8qlqxz4b1umWdT4pAXcpcMh1wwuL5Cbu0NVEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919454; c=relaxed/simple;
	bh=CoDGUZMJDqN+0YCPh/a9gAyngxKBuuwfwa8FulG9sWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U5vK+/igKNHkUnDS9hPtYDcuRoLfFCAVF8OAHz/Gp74aFMYS8Yv+13xqxxPlu5yRgHMhcDqwe/MiCfvqcQb4S2SWJot0GJX+a0jaYX0A5cX6b/iB+tKIXiVTh2UGAE7RGebK9jLN8sytss77CY/O9ppWXU3NN5KTPd+5M1Rpen8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=fHrPcClz; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="fHrPcClz"
ARC-Seal: i=1; a=rsa-sha256; t=1780919449; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PEaW9ve2pQKjfUZ0X2FrZXbmRcXaQ2ZAoSXxqZKo/8fpbJoHQX1d80XCG1obftUHJ0VlibkR1IBkO2TkT3tneX6j5s/v34ubMC3llmQIRXAak6aw0r2wIKo7Feu6/zYpGUizp0Gz9eC8SY0aYTs82xv6a25/wTYPpMxZ4W9Lg7Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780919449; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=N8QwmL/zUvZq+Z0dOkdo0qkdQeN++oUsqflLhl0ODGs=; 
	b=ZgJvYSdfRJPgf+iQfzK1fmi6nPzKUJM6BXwSZ1IVhwK8ZsA14iW1KV6UcwMooX0uvaixhpx7mCcSa8Jc9dDjoebMALa1y2QjED7FjJA8+jiT8vZGbUcYRUGQd2PW4zrBECbtsQw0GZaDYXL2Nqlyks1bl+X5JXH7WHm7YKNN0is=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780919449;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=N8QwmL/zUvZq+Z0dOkdo0qkdQeN++oUsqflLhl0ODGs=;
	b=fHrPcClza68l6TqRu6Wi5cy1IB23YxzSP4Tq62LGXT7RSmOC/LyFI1HtW4zssCjr
	nng9hLI3+O8ckJJ/8PKgKA4U6bT94TwpphFm56ZzrWE/OUGyoHcebMlTnBhDRIW+o55
	HR/GQKpSawczhUXUjTY0GbFtkWuP6bexC5u/srTA=
Received: by mx.zohomail.com with SMTPS id 1780919448117111.33985618669419;
	Mon, 8 Jun 2026 04:50:48 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/display: hdmi: Only allow BPC values of 8, 10,
 12 and 16
Date: Mon, 08 Jun 2026 13:50:45 +0200
Message-ID: <E83PzEAaStOECMxPCtZE3A@collabora.com>
In-Reply-To: <ySc94bL0TleBGnFIdX95hg@collabora.com>
References:
 <20260608-hdmi-max-bpc-fix-v1-1-6e8dcebc7274@collabora.com>
 <20260608113023.67AFB1F00893@smtp.kernel.org>
 <ySc94bL0TleBGnFIdX95hg@collabora.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 8 June 2026 13:46:27 Central European Summer Time Nicolas Frattaroli wrote:
> On Monday, 8 June 2026 13:30:22 Central European Summer Time sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > 
> > Pre-existing issues:
> > - [High] The function `sink_supports_format_bpc` explicitly permits 16 BPC for RGB444 and YCBCR444 formats without verifying if the sink's EDID actually supports 48-bit deep color.
> > --
> > 
> > commit 767fa3cc832e8b93f697ad91bcc66e5b3b1ed85d
> > Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > 
> > drm/display: hdmi: Only allow BPC values of 8, 10, 12 and 16
> > 
> > As per the comment in sink_supports_format_bpc(), CTA-861-F defines that
> > only bits-per-channel values of 8, 10, 12 and 16 are allowed for HDMI.
> > Allowing more than this has surprising consequences for the atomic check
> > phase.
> > 
> > > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > > index 4867edbf2622b..b06499dbfe8b3 100644
> > > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > > @@ -419,6 +419,16 @@ sink_supports_format_bpc(const struct drm_connector *connector,
> > >  		return false;
> > >  	}
> > >  
> > > +	switch (bpc) {
> > > +	case 8:
> > > +	case 10:
> > > +	case 12:
> > > +	case 16:
> > 
> > [Severity: High]
> > This is a pre-existing issue, but does explicitly allowing 16 BPC here
> > expose a missing validation check for 48-bit deep color further down in
> > sink_supports_format_bpc()?
> > 
> > When checking DRM_OUTPUT_COLOR_FORMAT_RGB444 and
> > DRM_OUTPUT_COLOR_FORMAT_YCBCR444, the code validates 10 BPC and 12 BPC
> > against the EDID flags, but completely omits checking 16 BPC against
> > DRM_EDID_HDMI_DC_48:
> > 
> > drivers/gpu/drm/display/drm_hdmi_state_helper.c:sink_supports_format_bpc() {
> > 	...
> > 	case DRM_OUTPUT_COLOR_FORMAT_RGB444:
> > 		...
> > 		if (bpc == 10 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30)) {
> > 			drm_dbg_kms(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
> > 			return false;
> > 		}
> > 
> > 		if (bpc == 12 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36)) {
> > 			drm_dbg_kms(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
> > 			return false;
> > 		}
> > 
> > 		drm_dbg_kms(dev, "RGB format supported in that configuration.\n");
> > 		return true;
> > 	...
> > }
> > 
> > If the TMDS clock limit permits it, the driver might incorrectly conclude
> > that the sink supports 16 BPC and program the hardware accordingly, which
> > could result in a black screen if the monitor doesn't actually support
> > 48-bit deep color.
> > 
> > Should a check for (info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_48)
> > be added for the RGB444 and YCBCR444 cases?
> 
> Finally, we have automated the ultimate Linux kernel review response:
> "while you're at it, can you fix everything else wrong in this code?"
> 
> (No, this does not expose any pre-existing issue; the validation is
> more restrictive than it was before. That it's still not restrictive
> enough in all cases does not introduce a new problem.)

Correction: there isn't even any problem here. DC48 is the highest
bpc, so the check is redundant anyway, which is likely also why it
was omitted.

Bad clanker! Bad bad bad!

> 
> > 
> > > +		break;
> > > +	default:
> > > +		return false;
> > > +	}
> > > +
> > >  	if (!info->is_hdmi &&
> > >  	    (format != DRM_OUTPUT_COLOR_FORMAT_RGB444 || bpc != 8)) {
> > >  		drm_dbg_kms(dev, "DVI Monitors require an RGB output at 8 bpc\n");
> > 
> > 
> 
> 




