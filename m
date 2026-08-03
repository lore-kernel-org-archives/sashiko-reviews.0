Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CA0423E9D
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 04:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785816658; cv=none; b=TVLIKfk/fJ4iZPnYUcRvs7DV/+w9IulkJK/81BEC9BeSrRzcfCboRvk2l44Yj/rOIAa7yvkWctOsHlwnoHKGt5WptEXNcAyAuicCaUS5asb3QNfy18+D1LBRFqZ8GOn54TjtKzaO0g601fBnkrEWndiL8Gk0PC9F2OzqsUHfug0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785816658; c=relaxed/simple;
	bh=OhD/yEFhUGihcpSsRGs/dbnXlDc4PeCN7WQIqEtisDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WstG3oZ/lODUxmRgdwILnG5R1Ma5UudB40n8iZ4yXqYofA+TEhjAa05dBFlqUCvZtg7RBa+HQ0ApiLXGGa0oPS3R1wHXiGcM3T51EHX0T6LMVCVVUYNPqFkr1kpkGFHUy7zxO9hMm9+KgMgNr03g9Sg8tS4uNnemN5WC9zP0Awg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=w+h+sJSG; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="w+h+sJSG"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785768591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Idn/88+dNM3THJaU3R/zT+H0rXSmXeg/6ZwPUJ48gU=;
	b=w+h+sJSGt2IzV6XC7ikdjTvriPeDmidh29HXG3gACWWB8LCNsXbrL8ORsWs3yxZlXGK+hD
	SygL2nbcsRO3RSfdsX3yIps0oiDlVEl7gfPThiAnTrT3aiTxCPmVdE/vtRKzydMNQMvPr5
	e1lyGFKGojFMwWb1od5B4xwmI8wvfx8=
From: Junjie Cao <junjie.cao@linux.dev>
To: sashiko-reviews@lists.linux.dev
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: Add Novatek NT36532 panel driver
Date: Mon,  3 Aug 2026 07:49:39 -0700
Message-ID: <20260803144941.1402261-1-junjie.cao@linux.dev>
In-Reply-To: <20260729162847.9F4A51F00A3A@smtp.kernel.org>
References: <20260729160804.912826-1-junjie.cao@linux.dev> <20260729160804.912826-3-junjie.cao@linux.dev> <20260729162847.9F4A51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Wed, 29 Jul 2026 16:28:47 +0000, sashiko-bot@kernel.org wrote:
> - [High] Missing Kconfig dependency for DRM_DISPLAY_DSC_HELPER leads
>   to linker errors.
> - [High] Improper use of DCS brightness helper inside a vendor
>   sequence corrupts the initialization payload.
> - [Medium] Global static DSC configuration structure is assigned to
>   device context and mutated by host drivers.
> - [Medium] Missing DRM backlight device registration and OF backlight
>   mapping.
> - [Low] Panel physical dimensions are defined but not reported to DRM
>   userspace.

Thanks for the report. What I'll fix in v3 first, then the two claims
I disagree with.

Will fix in v3:

1) Kconfig: add select DRM_DISPLAY_DSC_HELPER + DRM_DISPLAY_HELPER (for
   drm_dsc_pps_payload_pack()) and DRM_KMS_HELPER (for
   drm_connector_helper_get_modes_fixed()), plus depends on
   BACKLIGHT_CLASS_DEVICE, like the other DSC panels. Verified on
   arm64: disable DRM_MSM/amdgpu and the other DSC panels and Kconfig
   happily gives you NT36532=m with the DSC helper off, leaving
   drm_dsc_pps_payload_pack without a provider. Most DSI hosts and all
   the DSI bridges select DRM_MIPI_DSI but not the DSC helper, so this
   is easy to hit. Good catch.

2) The set_display_brightness_multi(0x00d4) call sits in the page 0x23
   vendor dimming table (0x4e..0x52, one byte each); 0x51 there is a
   table entry, not the DCS brightness command. The stock OnePlus
   Pad 2 firmware DT sends it as an 0x15 short write (51 d4), while
   the helper emits a long write with a trailing 0x00. Will switch to
   a plain one-byte write. The "51 07 ff" after switching to page 0x10
   is the real brightness command and stays; I'll write it as
   MIPI_DCS_SET_DISPLAY_BRIGHTNESS with an explicit 07 ff payload
   instead of the byte-swapped 0xff07 (same bytes on the wire), and
   drop the other accidental MIPI_DCS_* macro names in the vendor pages
   (SET_GAMMA_CURVE, SET_ADDRESS_MODE, set_pixel_format, ...).

3) Make the DSC template const and copy it into the instance at probe
   time (ctx->dsc = *panel_info->dsc_cfg), like panel-novatek-nt36536 does,
   so the module-global struct is never written.

4) Call drm_panel_of_backlight(). Brightness on this device comes from
   a separate KTZ8866 backlight controller via the standard
   'backlight' property (already allowed through panel-common-dual.yaml,
   so no binding change). Without the hookup the backlight stays on
   after a panel DPMS off; reproducible on the device here.

5) Move width_mm/height_mm into csot_display_mode; modetest currently
   reports the connector as 0x0 mm.

Won't change:

a) "extra byte could shift subsequent commands out of alignment" - no.
   Each DCS write is its own DSI packet with its own payload length; a
   longer packet can't corrupt the ones after it. The 0x51 change
   above is about matching the vendor sequence, not corruption - the
   panel comes up fine as is.

b) The two DSI devices keep sharing one drm_dsc_config; only its
   storage moves, per 3). Both links of a bonded panel must run
   identical DSC parameters, and the host derives the rc parameters
   deterministically from the same seed values while the pair is
   brought up sequentially in one thread, so there is nothing to race.
   Per-link copies would just be two structs that must never diverge.

Thanks,
Junjie
