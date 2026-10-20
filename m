Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490677;
	b=JHwfb9UsdxkjRATPvbmsIzjUNZ5p2daTkAcArC1RA3EW53T0pfCPoeg6b02iOTTgLH3P
	 yWQZLTw2qnWQk+k2iHphVfT348wxuUHf6BuHH8/KtSXgBPDKWhBB7Rw+NnTRplvvldGhG
	 ZzT92iRfa+Gr/QxNQ/Z7gKR2LwCeY5TaLUIxe112V44Ux5xQ1dCK4fGrdUluaKjoFyJWg
	 0+moX3w5y5yLrLeMk137rifxUgaeeyBUL1KH9/0Tc34Rf88ES8yVG1rWX3tTRCmnMgvsD
	 Q62AhO32FSOBqo8cL+F+XodhxTgm9nKbCJA7qlU/Tcj1EoR4foN7AfZwuMegWxbNqLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=U0/lnzk5hFsVd5ZzP5Fnt4j1JlLknKQhx8BKtAG3IEE=;
	b=3mKUOCELR9nkB1yxk/24K4WVw3xwcEsyRGkDqX2QY/i6uvugF3Em5Riw/nlSvpb51NM9
	 bUwVIJMgI8U142QuX23g8e+W231ooL/veKoJ+j0gEIhG7sm3ZkGZzq03isHnenjWameh5
	 Tr/Dlhy/0l5fKrLVP13a51ygHWcQ+nyJf2qB027/Wwa5R2bnV2DrUZRw5WVz9O1nUTB+o
	 REreJQia08Y9aD4gI5w3wqvspO9VD7gQ0pPDb9vmvPWhAh9QtsH7tcPPGmUJnP4tDL5+E
	 ChydeY0kGrsRasiAXUN/saXuAPHgQa2wOAm0KPg7n0ofsiuZVuNjoLirOZQPZX++9Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o+2RxzIm;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA7A606A31A
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 10:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EA7A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o+2RxzIm
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-353804b591eso5791869eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792490676; x=1793095476; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U0/lnzk5hFsVd5ZzP5Fnt4j1JlLknKQhx8BKtAG3IEE=;
        b=o+2RxzImk6rim5NkI4UGDo51eHi0wrk3XL7J5fZP2AFG5N/SPPqTMIgzh+zgeZ7dX3
         YvxVA0yfigOY4FIunIqPF+gGfAQe5Ay8CAhNY9UDZqYr+SjdJu7P5fHznEXrMj4Pf2Po
         ToHJcDh+BgDhmOPqMF5mOCl5EtPmX/qL9Y20DD2pKmgvydaL23I9jAQ6PRaP8B/V3NM5
         nyJDrlrp9W3KqoObz+U6y8YgrySuq4+NpYPO3VwVBt7JcBOAJwBrTemNwwfj4Z+XaOb4
         DWB6cExiGHG0Rb8QHP/0+A6Dgra4vEiVO5UGZvWhf9PMkxqxXJd5nirJqt8B7x4ZmZa1
         PWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792490676; x=1793095476;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U0/lnzk5hFsVd5ZzP5Fnt4j1JlLknKQhx8BKtAG3IEE=;
        b=1yn4OUEbpgDLnkv79UkgFzC2tlVfSWI9xc8hznVC3WaABhubIUfXNnRhbUnA4mYMuC
         ssB9rZ19zp9Dq021Aj5E0fxFjlZSJTekwf4vdkNQBDDXTNf+bR5Eb8rJwdNuLpaz+JY5
         AOO6U9B2nWXhmBejiVhw2A04Zh8okjYRoDFdnvS3qsyPDCvtuugxhhzoPnhuMdYQORNS
         C8u3TSmUYgLACYTuWudXPxdX0vq1nArRwn2SqinvvvDPVb90VlqY4p6u+zB9/j3jJ+6m
         y5MR/hZDqFS85EGqhFRExNgamrTuk1sqvGP/kDhoj02QPy7XGaks/erYNS7zFzfTCT4f
         UsWw==
X-Gm-Message-State: AFq9FYKY046smvfhRwJLXz2+KFRvl2/2DnXQWf436X8BOXB74mXNQsAr
	SSpsEHnAQ4sNoGtqPyAk3ppEf1rcYdefgDs88L5wAfUpDBJ1+iyeDhWrTbih8Yey
X-Gm-Gg: AYBFou3XRZolOTpp+HmmP4UnCtghIdw1c5Tv6ilq9BSoqVgoYFtf8rNJHTq7VUrVkQ9
	WAvJj9P8OiK6iyfsVxNT0mZB6i05KgR0q7+JB/grg3Ie6MLlWKqzzM5OKwLfURFBwy537Bpk3xc
	CnVmtOCsgI9cP4RA69qlPG3pj+1XZ7b93J1b50yYYATKA2Uy5ZkyWbVGSwFhCt5NPEy85msCVGy
	hZzp1BoDXwqVW2bFkG80v9bIX5ARZlTc0D6o+uQNpfeMRq3tfAdHMbQlcoSpkUU+aGe/lfxSlqg
	+qA8vWSZXKo0W+omlvxynP4N1zBWPYiP4PISHM6mrABU3xiT9OiIRXoVpcFPxfOXhuXm6K/l7Aq
	K+vGVR6O0XKDA3B1GBP0gY0EwfPLt3ZCfqGRSxG7d4l8q4gvyTWRGtys8JrGee1MEK8aQFCGEkR
	A6yJooH7hD/uckkefD8bWBDbtxb6SIBKoC7+eO+lPY62Xoj6UGM7HuY2YotFBEocnv+b+2DUEMz
	A7OJK6IwcqDfDCA4/R8IxGU6DN0Li+mIfAsZfHUfbb+Odd6LcHCZqqGQ5vD5w==
X-Received: by 2002:a05:701b:204f:20b0:151:7f08:5961 with SMTP id a92af1059eb24-1850c9cf541mr15980378c88.4.1792490675971;
        Tue, 20 Oct 2026 03:04:35 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831996071csm36076766c88.9.2026.10.20.03.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:04:35 -0700 (PDT)
Date: Tue, 20 Oct 2026 07:04:29 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v2 3/3] ARM: dts: imx6q-apalis: Add VGA overlay
Message-ID: <t5mkri7cbalmy55ylrb7stanrnmxc7ep4vhmtw2nzulhgdi6wm@jsdhywrqubwx>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-3-ef6a3a780472@toradex.com>
 <sashiko-outbox-177001@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-177001@kernel.org>

On Mon, Oct 19, 2026 at 10:36:09AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ARM: dts: imx6q-apalis: VGA data-enable-active ignored by simple-bridge
> --
> 
> commit a66c8dd73182954ba43ed81cada90ae73edf93a0
> Author: Leonardo Costa <leonardo.costa@toradex.com>
> 
> ARM: dts: imx6q-apalis: Add VGA overlay
> 
> This commit adds a device tree overlay for the VGA output on the Apalis
> Evaluation Board, connecting the parallel RGB display interface to a
> non-programmable video DAC and VGA connector with an active-low data-enable
> signal, and wires up composite DTB targets in the Makefile.
> 
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
> > new file mode 100644
> > index 0000000000000..991c2b7c27773
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
> > @@ -0,0 +1,80 @@
> 
> [ ... ]
> 
> > +	vga-encoder {
> > +		compatible = "dumb-vga-dac";
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				vga_enc_in: endpoint {
> > +					data-enable-active = <0>;
> > +					remote-endpoint = <&vga_display_out>;
> > +				};
> > +			};
> 
> [Severity: High]
> Does data-enable-active = <0> on vga_enc_in actually reach the IPUv3
> CRTC?
> 
> In simple_bridge_probe() in drivers/gpu/drm/bridge/simple-bridge.c, the
> data-enable-active property is parsed into timings->input_bus_flags:
> 
> 	if (de_present && !sbridge->bridge.timings) {
> 		struct drm_bridge_timings *timings;
> 
> 		timings = devm_kzalloc(&pdev->dev, sizeof(*timings), GFP_KERNEL);
> 		if (!timings)
> 			return -ENOMEM;
> 
> 		timings->input_bus_flags = de ? DRM_BUS_FLAG_DE_HIGH :
> 						DRM_BUS_FLAG_DE_LOW;
> 		sbridge->bridge.timings = timings;
> 	}
> 
> However, simple_bridge_bridge_funcs registers atomic bridge state
> callbacks without an .atomic_check callback:
> 
> static const struct drm_bridge_funcs simple_bridge_bridge_funcs = {
> 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
> 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> 	.attach		= simple_bridge_attach,
> 	.atomic_enable = simple_bridge_enable,
> 	.atomic_disable = simple_bridge_disable,
> };
> 
> During drm_atomic_bridge_chain_check() ->
> drm_atomic_bridge_propagate_bus_flags(), sbridge's
> bridge_state->input_bus_cfg.flags is overwritten with the downstream
> display-connector bridge's input_bus_cfg.flags (which is 0), and
> sbridge->bridge.timings->input_bus_flags is never copied into
> bridge_state->input_bus_cfg.flags.
> 
> Then, upstream in imx_pd_bridge_atomic_check() in
> drivers/gpu/drm/imx/ipuv3/parallel-display.c:
> 
> 	if (next_bridge)
> 		next_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> 								    next_bridge);
> 
> 	if (next_bridge_state)
> 		bus_flags = next_bridge_state->input_bus_cfg.flags;
> 	else
> 		bus_flags = di->bus_flags;
> 
> Because next_bridge_state is non-NULL, bus_flags is read as 0 from
> next_bridge_state->input_bus_cfg.flags without consulting
> next_bridge->timings->input_bus_flags.
> 
> When ipu_crtc_mode_set_nofb() -> ipu_di_init_sync_panel() runs,
> sig_cfg.enable_pol = !(imx_crtc_state->bus_flags & DRM_BUS_FLAG_DE_LOW)
> evaluates to 1, driving the data-enable pin active-high instead of
> active-low and gating off the VGA DAC output during active video.
> 
> Should simple-bridge implement .atomic_check to populate
> bridge_state->input_bus_cfg.flags from bridge->timings->input_bus_flags
>  so the active-low polarity is propagated to imx-parallel-display?
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com?part=3

This and the other comment regarding atomic_check are addressed by the
patch series below, which is listed as a dependency for this patch series:

    https://lore.kernel.org/all/20261002-v1-simple-bridge-atomic-check-v1-1-ef5d8332b078@toradex.com/T/#u

Leonardo
