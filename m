Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906811;
	b=Uf7d1MFecN6C78vfkL2/FZG8Qflzq8wyFOF1R2H0QRyHOhkvgkeAzYiX8AbM1LVLkBHP
	 xWCVk3jbOSXvZZytd7xuh39K4IRp+tGnMFFAd+FO9tlGP5ThBSw+blVYRf+chbPg3lbCN
	 bRzonX02kM4rjNUB45PaThWLtpI6B8iP4a+di5Ne7AmllB+HUs7pM2P1743ESylaRifKG
	 UYupU9hJt75Ye3ClLCey/yF0MZKfMh043pC0rdSJVftgWBn5DZ2zRn/EWZz0+hN4N+Gs2
	 QQrNCjIbpPsily9wsd+Oodf8JtcGVEerIbFQwPgvEB6pEuxd1Z/stzN/CLC4RJ5kAdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906811;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type;
	bh=3vCu5O5rBFup8zOyNToLTiowXoRh2airbpyexQsIArg=;
	b=yjgGvkKagQ3s643/zMmUUiOnCwbHqIr/ZKJUhjCAAp/Kv2ecvC/gn7FhKxb2TNt2ta7q
	 cyNY5e4DPJ+AUdDGbuewqv8RTdsiON0ckMUl1xGZLyGsenf9weP5ilddf+CF6QpOR6CPD
	 2whcMjmONK0QErKvE7hhiIl39Bx64qXKkOggYEmpQFiG6E5QN84miTMvinq26+m0gXk+i
	 WCahn/EbnjjakgySXcJY76UotIWJTOuaLKNjxihOVbxQd7kpW6SDsuQGdZqw2FzKbN2OC
	 7E0BKM8GfbIBPwhK+NM2j2yfQSxOi465XnQWOgGlp4ODAQvMscy8mHR+98z+TLWxIzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hEfU5TKE;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B3E606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 09:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08B3E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hEfU5TKE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794906809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3vCu5O5rBFup8zOyNToLTiowXoRh2airbpyexQsIArg=;
	b=hEfU5TKEvfmr3dpcoxmvXHWggQkFD9TgA9PhdMgxaoeJDF1sQ/v4f/o5q6bog5VUXIUpFX
	QsPtp9ML4oRtr5uIb0pIYzwbynErJKElcHR5HoHNOFx6Xp2XsaYSOWUUTN+HiHa27DMOI+
	+EA+jkeDL+nFCS51fcGg62pDqiFboZ8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-6OKL-9ndPOCsH8a0ob6hmw-1; Tue, 17 Nov 2026 04:13:27 -0500
X-MC-Unique: 6OKL-9ndPOCsH8a0ob6hmw-1
X-Mimecast-MFC-AGG-ID: 6OKL-9ndPOCsH8a0ob6hmw_1794906806
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-490c1867460so2689678f8f.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 01:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906806; x=1795511606;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3vCu5O5rBFup8zOyNToLTiowXoRh2airbpyexQsIArg=;
        b=ZD2iFMqtD7KLX0Xnl9WYO2ONXNSict6UpzB+81K1r7tXJOlF0qMRMInVXNplt3Y8cb
         oMl4H7iiFG2m3FWatY9zcimrwl3c2f85i24u39tlC/87izwGA7Vs+wmf5zx21JAYcXx3
         AP04ecniHSAECMawhXzrh/WOPmiYMB/lIW5PEqJRRABribtSrlhGetrD06g6phD4ZMMZ
         QZ3cXCNjmqUxXlf68IV4dlOdZaTKbIAJiqO6Zhjy/4cWZ72HB0mHb47403R7/gexzgpl
         XjCTlau4bQApBFsCRWwHJgEjRtRtiCCvZdae8wB9BXGH727AE0uqRzPgbP4y1HbTB/Fx
         r4XA==
X-Forwarded-Encrypted: i=1; AL+hErF0SMZ26wxJ39DA0nlUhnu8Y+UpGjwTX8IatSKc+5DY4n+3u2BzUKuJho9Q6/zP5SV5rrcZlXbLa1mDCeONT4g=@lists.linux.dev
X-Gm-Message-State: APuU4Z+fe4k8nTnYnIAjE92AwDjXXyhMSQ5Y5ddRGItCNCa7KjpuIGbF
	yQKpWSgy6UY9C5NW/lOTrR0ZUR0vvbR2NA7gnTiTziSCfKKB44AvfW/uRQip18ygfXlLFSmRC9n
	qwDexHo7QpVIFAt/PjnCseMwrHT+Vq/KG8EHDri+Yy/HS8UeLGGDidqY7eyultv4P4kAGVQ==
X-Gm-Gg: AYBFou14mgK3oFLrDYfsY/LrJDd4x20IFSHzbMJsjWsfLbA6tT2cChpqMi+WZ44bjlj
	BHh5hibhRb6oSvNS4ojKf9m5d062hgW1obMIWC3ce50FXxcOmPmnzLLaeC/dnq/v+yMbaYei3CO
	tNHk3AOUVSXx/4O1kgbzzBhVr0lxxJWJT60h8CnmdmfY3nt23nbIVoF7GsGaUhrGVJvxyfvgvaI
	sRPtXrr/qnwIFzxVMPxDjT09B645SQuNKmr7CTk/MgdcqwxT/EqbDasUmmbD90Opqznj53JPs2F
	8kG/kzve1PKM5fmrjGkPN9j6nQPCo8lI4sLWQMa8cotjE+Y0oufDPHwZEbZd31yygYI8oxfxQJx
	N3q4I6zMd73V56SZWbH2v6/QRzqOWyqTAFImqvD4ARjRIQ9EuAv+/+IOmWZuA6E8pybojLuxSvx
	fCCJDUhWDPMszetnv2X0C1M+q0dUTDYK+sMsr64pw=
X-Received: by 2002:a05:600c:46d1:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb76d62556mr75648915e9.0.1794906806331;
        Tue, 17 Nov 2026 01:13:26 -0800 (PST)
X-Received: by 2002:a05:600c:46d1:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb76d62556mr75648285e9.0.1794906805843;
        Tue, 17 Nov 2026 01:13:25 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm16989955e9.15.2026.11.17.01.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:13:25 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] firmware: sysfb: Remove CONFIG_SYSFB_SIMPLEFB
In-Reply-To: <20261117084514.367399-1-tzimmermann@suse.de>
References: <20261117084514.367399-1-tzimmermann@suse.de>
Date: Tue, 17 Nov 2026 10:13:24 +0100
Message-ID: <xlv17bibstvv.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xjzQiQ7j9AeOtYbjqQpcmxDf5XbII_xS4UoUo_qVjlA_1794906806
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Enabling SYSFB_SIMPLEFB creates a system-framebuffer device on top of
> a firmware-provided UEFI or VESA framebuffer. It is inflexible and lacks
> support for various features, such as EDID and color LUTs. Therefore
> commit cc79eaf8ee25 ("firmware: sysfb: Mark CONFIG_SYSFB_SIMPLEFB as
> deprecated") marked CONFIG_SYSFB_SIMPLEFB as deprecated.
>
> Remove CONFIG_SYSFB_SIMPLEFB and the related code. Remaining users are
> advised to upgrade to efi-framebuffer and vesa-framebuffer with efidrm
> and vesadrm on top. Also remove the outdated comment from sysfb.c.
>
> Note that this change does not affect DeviceTree simple-framebuffer.
> The kernel still parses them and creates a simple-framebuffer device
> for each.
>
> The MIPS architecture code creates a simple-framebuffer device for the
> display output on the Nintendo N64. Removing CONFIG_SYSFB_SIMPLEFB does
> not affect this code either.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

