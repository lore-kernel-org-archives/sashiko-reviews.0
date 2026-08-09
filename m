Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9EB4B0486
	for <sashiko-reviews@lists.linux.dev>; Sun,  9 Aug 2026 01:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786237297; cv=none; b=BTX0ueuPjk1wQeDh+Mt6PER874dDFsQIGF3nTm6GUL6HH3DgLqUx+gXfhmFln0Oywq5LG06u/PsSIPpY4gEn+JHAX3/AoLK5EU7Ij5pVLzQOfbtiG7USjRKF9I3VWtmiizTX3uu24CggDPClqQ51p4igLC7Eac5MXwaIilYviTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786237297; c=relaxed/simple;
	bh=PQq+lKTeK7k4HPNl1hyqWFlesD4mUjpD9Z0LOKkkekQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FD2/NCyIWUmKNYCEZBzXCGlrOTpbDSVoKClDG7SEP5umU8g1AfIW5JyZu1MJdsQuAcP50s8vq/f2BzZzbIpwAySu/9z86GcND7aasbKxhS1CJzV/7Mo8rgEFjYl5rTeEyXWd60gT7Au2W+xEdD6VUxMoTcT9iy4MwhEVHBvbrjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sVFAitq5; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sVFAitq5"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-c9fcd903839so468000a12.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 08 Aug 2026 18:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786237295; x=1786842095; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bTU4eIZnw4U9ZhD6oNkBxDN+wvA8F1rOyrlQvDjEprA=;
        b=sVFAitq5lFEJwONQJ41RV2s0C5DmNqo3MMfEDlPdet25D8pnB900RRjhWllTf2alSs
         NpiIQ0dqJ8h908YsBnyF+xpk/W96AHLKZ7sdofyVnLPWsFYdrGHRGj669QVIfvpiusL0
         p4wj+RPQkpVD9nmAYi3AzGV2mk5TAx7vtpwAoIZRpiwOJUHiHRQugLcNDALPWEh0VMUZ
         13Rh4sPXMt2X0TB3BKacW6N5/iz8ap2KlkuTO7FCoiR/LYXxch7Fg21XNdLOy0erGihy
         LdqgMWC0ia6kIvmHEZ/g4B3ALkh65ViCr+VykJ9BYex8i/cnzHiIZ1IRfcgKP2Vw0EOp
         U6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786237295; x=1786842095;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTU4eIZnw4U9ZhD6oNkBxDN+wvA8F1rOyrlQvDjEprA=;
        b=ekhxs61FvRSeMlkjBrWPw6EOP6JWxBpo4qGztGIuK5oGxW2anTJs4ncYmwJNjOARMm
         72OlIpv348DOc2R+2RTngbbpIFsoIoawIPs7p9Oq4F+aA3dCqAw3feBgROEAKCUrWiv2
         llrvtLpagZf1vSrHNYoUBpUwe5u4Re68XVujviHtn0qMM4QFeVBmlsjR32qS6JZvalBp
         xS98Mk6ZTdkpuAe1Xexn32wTBjrs5fYUWyjIV4HEJ6C/7b1yvX8oAktkCUjSP0e3s+PB
         ZlKDg0GCdTjR4QVvFbaslQQEYts8DXlBETJyhagp50n7yREkn6UULS+U6dXFDUgXAflH
         VrzQ==
X-Gm-Message-State: AOJu0YwjcrYepXW95REu0d2dqXYjjAqXgfsJVAmQR2db9AeoWdyLFLjp
	ewfSjSe+kVxI+azk6s6CQ7Mdr6Vs8BkJWip1kVsdID6XTJCM3EkRig5w2bqv+89Cv5/kQQ==
X-Gm-Gg: AR+sD10UPKjy+55ofqVocjU0TUvc8k4KOCmuFfh8S2SDqNIMbjkaztu6GvfSChH8mrT
	9hye5nT1XKHj8L0laKrtOO9qg4GX0pkSJuMXKhNItoz0K1XtCKLDrPKAxtiDRo8An+Y0zdSvhL+
	CkEcgItFRlrZrfx+gD6zIn/phR68vnoP5kAsZvNkvhOmzG4EI9ch/eYLp/IU2kYupqhicK2MWVw
	74/toob7SvGW0wFHKNgH4kLtZ/uhP+gTLL422YxWXs24xHOz84n+tfucXfxpIg6zwn868BUnvFI
	qrV0sU1O+EzLkkdmfLD6FsR7G3wqKE8UCkAC4RdfndwmjqeAOUw2kl00HVRCbus5DpP1odnoVTu
	XblTtyrIHwpAPow5MxD2m/rh8KWDktKFDAUopklwzLuH25aQ3255hHk6fIiL9MlEbrMwtHb+zzr
	LZ8U6y1jq++N3BH9yunFJaCso0ESlAdbQNR1uwgOk=
X-Received: by 2002:a05:6a00:2a0e:b0:848:6c37:cd74 with SMTP id d2e1a72fcca58-84f696a0369mr12238522b3a.22.1786237295147;
        Sat, 08 Aug 2026 18:01:35 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a55f304sm2378524b3a.49.2026.08.08.18.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 18:01:33 -0700 (PDT)
Date: Sun, 09 Aug 2026 09:01:28 +0800
Message-ID: <4da43aa690649fda8565941ee576338b.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, olteanv@gmail.com,
 linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
 devicetree@vger.kernel.org, sashiko-bot@kernel.org
Subject: Re: [PATCH 11/17] drm/spacemit: add Saturn DPU DRM device driver
In-Reply-To: <20260725051713.B60E61F000E9@smtp.kernel.org>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
 <20260724-k3-display-v1-11-f22a10a52867@gmail.com>
 <20260725051713.B60E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 25 Jul 2026 05:17:13 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Missing IS_ERR() check for 'match' causes an ERR_PTR dereference inside component_master_add_with_match().
> - [Medium] The atomic commit tail stalls the commit pipeline by waiting for flip completion before signaling hardware done.
> --
>
> --- Patch [11]: [PATCH 11/17] drm/spacemit: add Saturn DPU DRM device driver ---
> commit e12174b9614adeccb5a06f03b5944837004e96f4
> Author: Cody Kang <codykang.hk@gmail.com>
>
> drm/spacemit: add Saturn DPU DRM device driver
>
> This commit adds the DRM device for the SpacemiT K3 Saturn display processing
> unit. The SoC has two DPU instances, each driving one CRTC that scans out a
> single primary plane in linear RGB, feeding a downstream DP/eDP controller
> over an OF-graph endpoint.
>
> > diff --git a/drivers/gpu/drm/spacemit/spacemit_drm.c b/drivers/gpu/drm/spacemit/spacemit_drm.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/drivers/gpu/drm/spacemit/spacemit_drm.c
> > @@ -0,0 +1,132 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2025-2026 SpacemiT Co., Ltd.
> > + *
> > + */
>
> [ ... ]
>
> > +static void spacemit_drm_atomic_commit_tail(struct drm_atomic_commit *old_state)
> > +{
> > +	struct drm_device *dev = old_state->dev;
> > +
> > +	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> > +
> > +	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> > +
> > +	drm_atomic_helper_commit_planes(dev, old_state,
> > +					DRM_PLANE_COMMIT_ACTIVE_ONLY);
> > +
> > +	drm_atomic_helper_wait_for_flip_done(dev, old_state);
> > +
> > +	drm_atomic_helper_commit_hw_done(old_state);
>
> [Severity: Medium]
> Does calling drm_atomic_helper_wait_for_flip_done() before
> drm_atomic_helper_commit_hw_done() stall the commit pipeline?

Deliberate: the cmdlist engine reads the old state's DMA buffers
until the frame boundary, so the next commit must not start
programming (nor the old buffers be freed) before the flip
completes. Will add a comment in v2 saying so.

> By waiting for the flip completion before signaling hardware done, the CPU work
> for the next frame (such as state preparation and buffer pinning) is blocked
> until the hardware flip completes.
>
> Should commit_hw_done() be called before wait_for_flip_done() to avoid
> degrading atomic commit performance?
>
> > +
> > +	drm_atomic_helper_cleanup_planes(dev, old_state);
> > +}
>
> [ ... ]
>
> > +int spacemit_drm_of_component_probe(struct device *dev)
> > +{
> > +	struct device_node *ports, *port, *ep;
> > +	struct device_node *remote;
> > +	struct component_match *match = NULL;
>
> [ ... ]
>
> > +	for_each_child_of_node(ports, port) {
> > +		if (!of_node_name_eq(port, "port"))
> > +			continue;
> > +		for_each_child_of_node(port, ep) {
> > +			if (!of_node_name_eq(ep, "endpoint"))
> > +				continue;
> > +			remote = of_graph_get_remote_port_parent(ep);
> > +			if (!remote)
> > +				continue;
> > +			if (of_device_is_available(remote))
> > +				drm_of_component_match_add(dev, &match,
> > +							   compare_of, remote);
> > +			of_node_put(remote);
> > +		}
> > +	}
> > +	of_node_put(ports);
> > +
> > +	if (!match) {
> > +		dev_err(dev, "no downstream component available\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	return component_master_add_with_match(dev, &spacemit_drm_master_ops,
> > +					       match);
>
> [Severity: High]
> Can match be an ERR_PTR here instead of just NULL?

Real; will add the IS_ERR() check in v2.

Cody
