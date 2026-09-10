Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC523A7F54
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027877; cv=none; b=G1SXVJ8Nu5k/j6wNEeIYWFEEkml52H4NRV8TRRuCCkTKA/ZmDdiJXsUzi+iT3lsnMDK9YKNIir8hrS1qxBtwBxMGTJyfwx91czjlzobQgKEEEK5AUcmGCbpdZ9Btvhm53rfld7QEhLy4KyPDJDqO6xZyxBZ+rP3GmChu2U/sVx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027877; c=relaxed/simple;
	bh=vgTt1CKugXmTVCyKAK1V5bcR84Bpza5H6R9rp5ITitg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mtPrvTRuenhEB5S0F5GeTb6v7Lw3yjNxOemJjEP44hgPo8awrZK7I5AUluCZ/WhRlr6ixN1W6oZizSVX094vKt4NiFLw6lMpLjb2RV4pjNQE/qMTICbpuZX+tQ0Nnnu2rlep/kzxfJLbyTDPGoAHU8lm2M6LEGqcLmfyDVlwu30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IG8/mI3j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IG8/mI3j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789027874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DHVsvo6RwXVpI3O0qorfwMCGL9oJM3VblhLkUEiQrLE=;
	b=IG8/mI3jUmKq59CE+EOS0OknKjl7nvZ1X+aMoYbZKqCMBsFl+7fiPhO4tQaA0Izz6ryM3i
	luZkrNUHSacSEtd8AlICBo/k9qKS4Q922HsjURROHgwWTvkrZ9D2AX1BuqXHGQxpcy/rn1
	vxz7uC/RMydmqkQ1MfjolDwO0BBOvhM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-YEy8alVfOdWJN4pFFxBQFg-1; Thu, 10 Sep 2026 04:11:13 -0400
X-MC-Unique: YEy8alVfOdWJN4pFFxBQFg-1
X-Mimecast-MFC-AGG-ID: YEy8alVfOdWJN4pFFxBQFg_1789027872
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-485b0c83a89so1231296f8f.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 01:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789027872; x=1789632672;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DHVsvo6RwXVpI3O0qorfwMCGL9oJM3VblhLkUEiQrLE=;
        b=HXtxLsQWHVBwxPByyBWb2GkTdpu8P8X1lbKLEaukUX1HfOBjPHmmx4M3/nShWkqYyx
         P6u0MpboMLehIrK63kH9h85lCFAIsh0Znz1mKP3A/JNpqlY1v7/FlhCG8zubrGKQTaji
         KwTg5SyfthF7znhSnqFj1SnfY1t6YJyo9gby7g23ACvKE/RGbASsE1jd3vDwej2Qzgjr
         1ZAujfzarBMMhX7tXgGrKsJevu7ih5/A2JjlXAgSOYpsHSPO2z8a5wPyQPn5gk2YhwNX
         vmPYhJ72YnYThkW+sjwZQQE0PfoimUvZDkN8IefzxizCLXfqhC5SUGw2YThMYZW/wzCR
         vMZg==
X-Forwarded-Encrypted: i=1; AKwUvBy86OIus8PxOPb7vkbijfgYChZnvjuRiMc2ZE7bUBhH/jtvTOQy5RLiX9iTA82SRFtUt0Z2AXu71eIsagPK8h8=@lists.linux.dev
X-Gm-Message-State: AFuF++lSrKXJ+dxlH3UrfJSX/ZLSxeYTBjcyaFjE79liHUJkozVxgrY+
	QKsVYJEMFIUolIbXi9Drb0Bp+lyUmTPzXU0oFCPLwIm1/0MQL7mJ5lCQGFJ3jNKD5aYKnsJuh1h
	qY41TL0frZmLLPLFQt7aYFplQtyQXVbDjVJEkyQBtpM9zsDc3kIAXKkONb5pOSR6DcyvYJw==
X-Gm-Gg: AYBFou36VOiNVOffcy1ctOuImojODsVoWqhSt1XgM/YOqs9Sq9dZI4R0YiTeSp2rycV
	0yyMjxkUDV3Pea/QjQBxEg4h0nCMpJ2y73XJJuFi80tpGi9sAvqeNZuMkCzRDL7jCBxjKc+wh8j
	rv13pfHev78LeXBU6jopr7Cl7q2AbHue+UTf8eqx7op5js0kxlAWIzEviJsW38y1VN4HWPPmpsz
	P16TGBFLTLWeXKdEGvczFqPOHa+Xb8JbO5nHmLV3oMlIxKKXKTlPhQQLExysFJqxxB52re9VX1b
	6AbyUFJq9xbi6qE5RlRVa1rLRpXg86A4ZJXpieIrwcj3D/fOMzPNucOYNPgsnVNVgou87EaDB20
	j8vOJBO6OTQECioRHYQHRYOPQVKvgAjLw/usOQl4OVKO4s/7AeqA7H4NLKA==
X-Received: by 2002:a05:6000:4694:b0:482:fb97:2ae0 with SMTP id ffacd0b85a97d-485872ade60mr34287611f8f.14.1789027872246;
        Thu, 10 Sep 2026 01:11:12 -0700 (PDT)
X-Received: by 2002:a05:6000:4694:b0:482:fb97:2ae0 with SMTP id ffacd0b85a97d-485872ade60mr34287569f8f.14.1789027871872;
        Thu, 10 Sep 2026 01:11:11 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm52649193f8f.24.2026.09.10.01.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:11:11 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org,
 ilias.apalodimas@linaro.org, jani.nikula@linux.intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-efi@vger.kernel.org,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 3/3] drm/sysfb: Use preferred panel size for panel
 orientation quirks
In-Reply-To: <20260904090850.43060-4-tzimmermann@suse.de>
References: <20260904090850.43060-1-tzimmermann@suse.de>
 <20260904090850.43060-4-tzimmermann@suse.de>
Date: Thu, 10 Sep 2026 10:11:10 +0200
Message-ID: <87v78dcyqp.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fwo_dd5lqCloybdYmerLYA6YL7bNvNLYS030X3gA9WA_1789027872
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Sysfb drivers currently use the given display mode for looking up the
> panel orientation. But the look-up table stores the native geometry of
> the panels, so the lookup fails if the current mode sizes differs.
>
> Get the panel's native geometry with drm_edid_detect_panel_size() from
> the EDID and use it for looking up the panel orientation.
>
> v2:
> - ofdrm: validate EDID header before using it (Sashiko)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

