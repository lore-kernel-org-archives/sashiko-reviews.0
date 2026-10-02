Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDCA2E7BD6
	for <sashiko-reviews@lists.linux.dev>; Fri,  2 Oct 2026 12:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945515; cv=none; b=SQ28vAgAiTUNUDqRwXOj3o4kBfEAimCCn167UFszvFIFtjjoJzXCHfpqIfsiNgrjFd7zIsTBUWP/+AU4xCBFXlBefPUBLDXP5YQuLXbJV/4qLjdb+xLIEb5GGIgE1SXcNx1s4j94bIAJHEWklIIcHrWS8/AnRpLoL8q93bbrVvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945515; c=relaxed/simple;
	bh=53D/5/B2wvX6dN+ASmuNpK0/77E27Hvucfz5GPvSt78=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hVrsXonxXSh3y9Z2Vl/fLTfsaurjdp4h1rc5MB2pfiDATkOEM4py0RLY+CIfNpkvr9S8XSTk0JslPYOdnWJgU3BkP34bLLUUwP9rPZ+lIrz10jBwcGFlnuL5VCzDFtsSpWUBaGtztw5ju3Odu62a6o3NfcGSbcG6uKsbkTnWH3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NiAzmk6W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NiAzmk6W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790945513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B2xT9hRgPB5QRriD8h5Z5tNs8Qaw44VoG/fyOaMAKs4=;
	b=NiAzmk6Wx/uo6gP+bGspvIqcW4/tzggjR+c+Waz5L0ptwKMozTZa0We3eTPP+jdF7ADJZI
	MSa25urOY8+w60hYi2tvrk34rr9y2PC2IOUik9pTayLkEMIEFqqbEN6sGgnbC/+WLxTIah
	WOmkqGN2svoP9WKRNrlKsyXPCrdV3UU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-y1Mo5HRHOQiZGC60if_bbQ-1; Fri, 02 Oct 2026 08:51:50 -0400
X-MC-Unique: y1Mo5HRHOQiZGC60if_bbQ-1
X-Mimecast-MFC-AGG-ID: y1Mo5HRHOQiZGC60if_bbQ_1790945509
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48b02d63407so1931826f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 02 Oct 2026 05:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945509; x=1791550309;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B2xT9hRgPB5QRriD8h5Z5tNs8Qaw44VoG/fyOaMAKs4=;
        b=idwee1fS/Hu4NeWtGnXPs3WZo3t1HLkg2wDRriN0pIEWAOLrS1hEyynUfKOfxGLIv8
         +nGQeiHvo39uAPuHGW6Eq5gZv0ef13B0/q9HJmRHFLNGjxcFPk/uhCbpWYn8XdscnDe0
         M5pKbgkTqpNAzMx8fWog7lnPEcOCJWJkXfjZy38eh4j0zemz9NMeGUhNgy3gM2kWldli
         UGkk6z1TDi7WWiEIYTLJgLxqwxGcYcHQq1eY31SgcOmI+MTz0wqByDKI6LKLSkUkioLv
         fFH6sJ21xtZY+QwTW7SECM7IHjACVEGKEJWPHr8RyJEJHQLsT5zcab16Xf8DYX/tF0Q5
         xYQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNG2gVg1tf/MFC/XYBQi63x2VjRcPFiSDNrAbRZuaHO1P7fBNMUuprWIlmrgxuYCoBsCN3aMGfjqyEFTTjcJg=@lists.linux.dev
X-Gm-Message-State: AFq9FYLzQpt7t/cXYAvbLMcJPSSv159dvofvfcvHbyP5vRFaf7E2HGg/
	38HEaVMo2cJ+myywC/TVhzdOTX89Tl7avuAqO9SdlzvlXMIfOU+9VphqJ6c9ZbFj1J9CysOWk5/
	iDijD4/wTndsB4i6nhr5Uqtt5N8yZp3E9k5WLW8DffMp5JkNBrRvdsPn3g68gkRnlY6uk2g==
X-Gm-Gg: AYBFou0/IZxYazkf+FPNyzLaX0TC36jmH/e4K09SIoB/MrEHG+6ihD+3xB8GOTIMvzu
	vNP4zNkPuJhgunbIed8qon2mt96SWkv2JzXdcRxJPq0hruFKWNEIjZCOGzPOci1FQov3XENn1fm
	edCJNu05oc4TbXSC9/XeprHh6zpxsSQd5kvkYJw0beG90dsX2JPhLj8EcOtVAGkeRPjDzP/VcoZ
	U6X1RzxrDNu+h1x/w7AN5e2lAEyUqJFkOUJYWX2nhhlDHodW8Hdc1vDIT70RuA7OS8pCJVTOf7c
	IB8fPuMywOWLvldwTb8wMXVgzRAk7FeMhkSKtuSMFpI9BW2KfYyimqgtOywVSV3RFPk460ZBhF2
	YNotbtt7wMYSla8Ffv9zFUC8h8LlRv9FqjY2O+LoBRcwpgvAeu2U3fp52IJwHARkXWg==
X-Received: by 2002:a5d:5f53:0:b0:48b:74b:4ce8 with SMTP id ffacd0b85a97d-48b12754475mr6263177f8f.17.1790945508884;
        Fri, 02 Oct 2026 05:51:48 -0700 (PDT)
X-Received: by 2002:a5d:5f53:0:b0:48b:74b:4ce8 with SMTP id ffacd0b85a97d-48b12754475mr6263100f8f.17.1790945508338;
        Fri, 02 Oct 2026 05:51:48 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8c4asm5711527f8f.37.2026.10.02.05.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:51:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, ssengar@linux.microsoft.com,
 andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 6/7] drm/verisilicon: Do not include
 <drm/drm_simple_kms_helper.h>
In-Reply-To: <20261002124456.741011-7-tzimmermann@suse.de>
References: <20261002124456.741011-1-tzimmermann@suse.de>
 <20261002124456.741011-7-tzimmermann@suse.de>
Date: Fri, 02 Oct 2026 14:51:45 +0200
Message-ID: <xlv18q4g6za6.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5ANZFpQuPB3DcRi2-xrX3RNJKy89gJ2RAnZI5Z1AFuE_1790945509
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The verisilicon driver does not require anything from the simple-kms
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

