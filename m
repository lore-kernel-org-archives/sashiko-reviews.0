Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA4E41D63F
	for <sashiko-reviews@lists.linux.dev>; Fri,  2 Oct 2026 12:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945483; cv=none; b=FP7PTNObc3SGR89J7QTGDzL7rKPdL2CFaszB8tTsOthOhD+KLQ1sXamkf/AhvSlwn8n6hOK3oaWT1nXV7oS29PlGKyQBcM/Y1ivl7omp5uCn721GytB10w/r5jKOOqxte4E0VSf5vFURZ/CvikIljEWG/6pdiQc4HzNJ3/+A9no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945483; c=relaxed/simple;
	bh=Eea0KEkQbSlRaY4fITFghJeqNRMhlnUIBzIPKXj0Z20=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KE4Nfwknp+zhrDRPViq+pJsS3MZCpK1trfKlRkM69geNAmwOMo3+HRghZ8UfNkY1plS91UYM/M4iFNP3WG4yITgzM2dJCP+TY9kTp9a14NkMBJSjN46GemfI6Vre7DrxCIJ0FWmcSqoMtIfk6gwwoprAbC7RDY0C8kluy9cfq0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fx9FFUKc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fx9FFUKc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790945481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PXxRsRzuT/lLVwUTudBZrzfm5MyaTiR0eopkV7RSLVU=;
	b=Fx9FFUKcuqWsMKcrgcbU2omy72/4Iwq8mCO9c4Cf/W6TZtIazoTYpQn1CESOa6x1tixxdD
	xmJ7ivjdBR52SufhCVaTDTHqsqlxQMpS7A3hxESRtX9VryBQmC46iWGW1JK56onG8H5bkV
	NTfBzObYEjxnHLO6LAM3mKCXucXsPZ4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-vq_sY5r6Obu6AsgYUnQuiQ-1; Fri, 02 Oct 2026 08:51:17 -0400
X-MC-Unique: vq_sY5r6Obu6AsgYUnQuiQ-1
X-Mimecast-MFC-AGG-ID: vq_sY5r6Obu6AsgYUnQuiQ_1790945476
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a004b70f99so34141625e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 02 Oct 2026 05:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945476; x=1791550276;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PXxRsRzuT/lLVwUTudBZrzfm5MyaTiR0eopkV7RSLVU=;
        b=OkdR2PNZURYLEyyufkwc1zukSgJYXcEa2HZGGGq0o1UC8OCdnarIosU3qIETZyGh4I
         Od4vXqv63H6etUXIdauupTnxLLGfKSsNEqTPsQqFbpRpeivsbn0gOwvX+t8RY1YYhSka
         QqIH4IcywBr6BYUIE5S/5Bq6kyYHS4mKtDX7ICjWrfhLlXC3zdg1gzw1rYHEEFtLhOIR
         ML4CiKSzZ/+oIOtPEIYywBkB+RhNrU8J3SJqLVQDmr+s2yNSlUTCYENryuEJ2P4hU3KC
         P+iVELLMcVxaT8CYU8FaiVKtErYJlYLFPtw9m9k86QOy9TMFwu0MCnUaSsKjK7dFwWvG
         3mcA==
X-Forwarded-Encrypted: i=1; AKwUvBy4ldXiNsgETQWt2ZVqqcHOBOVFYz8WJ6CTZptHSGk782/8UzXTm9h/e2ZfNuB2c+7W3yWW1t7BzMCoGQ7mcH8=@lists.linux.dev
X-Gm-Message-State: AFuF++m1T+TtaJDSBQP1Emh6UYsLvTX6B0p5dtczlKl47O7D9vOw9b05
	baZQR/ZSO0Do/k5F88MXwLgq+fqQ7Dhjv+S8+cgEN0ZbNnKHBk8RrOyVuHDx19Lvn+a7MPsiyTN
	y9aN0s/1PN6NRWmVfLhtr72cJDIDNxosnM7MAstCoK/Zee7dyLraHktzUdaee5Gj5tCMMbg==
X-Gm-Gg: AYBFou0VUmV6ru2Vg1+1vtR8dYnl4FyEnIFNI/SWXY4STHbtvsE5LHckHYlHl0SncXi
	KloP2DYoOJO1DAyuvai1gxCxoi84gM7DAzTTFVYKGGVfeF0H+R19vbvJS9esebzeh+CTh/+8dzd
	OIlcmKab60G15eT6wUrkXkNglB1oxClHEkwTVJ3WpDJVdz/+hWsFGxPkNVCh6EMedFQDMwy9mdt
	TnrUeuRT5wwb3CnpMUUKCEPiri4CzHZFvHevmKms2l+prArQpadD0049i5BKcStTD2ijIQ+ffwt
	VoAxDHCKXMGbUAqNV+FWQSb9t0w7XQr42eYcguDoX7WDVffpl+vrefsIJB2Yhkd04iYDQaiGq82
	S4EANdocwcqLUI/e5i095Pcmc0JPqqkiBbx+N1TonAIZoh+H5POALWN96EVEZBj8JRg==
X-Received: by 2002:a05:600c:6098:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a0274e9d3dmr46216575e9.1.1790945476432;
        Fri, 02 Oct 2026 05:51:16 -0700 (PDT)
X-Received: by 2002:a05:600c:6098:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a0274e9d3dmr46216415e9.1.1790945476056;
        Fri, 02 Oct 2026 05:51:16 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm88527965e9.6.2026.10.02.05.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:51:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, ssengar@linux.microsoft.com,
 andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/7] drm/hisilicon/hibmc: Do not include
 <drm/drm_simple_kms_helper.h>
In-Reply-To: <20261002124456.741011-5-tzimmermann@suse.de>
References: <20261002124456.741011-1-tzimmermann@suse.de>
 <20261002124456.741011-5-tzimmermann@suse.de>
Date: Fri, 02 Oct 2026 14:51:14 +0200
Message-ID: <xlv1ece86zb1.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CLwN5l1hRBuuBSe6cmRfbtFQiqupfb7jYIaZhX6fbxE_1790945476
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The hibmc driver does not require anything from the simple-kms
> header. Do not include it.
>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

