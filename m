Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEBE3F329E
	for <sashiko-reviews@lists.linux.dev>; Fri,  2 Oct 2026 12:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945498; cv=none; b=on783Cy4phaGMruendIlMAKYbR3XkanhbzV7aFdqA/UpykEYjEew+kLQNyolBnhkIPjm0gJEoYn9ybI2PBd7WBstnMQKluK8aZvT2WFAqliXGoDuIoN7uGOqNMZ8x37/jInD+ULCMciIcMHEsOwZXoT5+oTQElqTNXdyH85t/jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945498; c=relaxed/simple;
	bh=uogOlJYX4gd2XJKCKqbyiAtKsfJrF2ZNwa7lsSTywSw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n1ev8PUC8q4RJM8rL34GGD8e1xtc4Re3BBYQNXu2EzD53V55kFWo05E6EzV0L/LfV8qiqDS3IMAXsfDxB1agg0k0PWdCbn5Xf6TQNm6GjCQgh/df23TmJaLAFDxXsQEK4eMaqT6NgZNxTB1OWUnZe/76tBV2sj5P1E6N5D1x7Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fN56wsxK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fN56wsxK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790945495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GUF14AtWHioqMuqb6hp7f6A6RAbZhDlhHrFpBFNr570=;
	b=fN56wsxKxAfHrE2DxWI+4XyqqglAhXQvC0ZvnO+1Wi+rie8k5cMxz7uvmg/GdcVBiWRBDJ
	rPr/nYjLTS+giVDkr1vKtwx7esJlgz1qQtncFftnlixcONOymyO80GtUcz95cgbAmK8zHQ
	gsWCPtzrwUQHLDbj2G1/IaRQSConsys=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-JtG5n9qUMQi57DA7J2QlyA-1; Fri, 02 Oct 2026 08:51:34 -0400
X-MC-Unique: JtG5n9qUMQi57DA7J2QlyA-1
X-Mimecast-MFC-AGG-ID: JtG5n9qUMQi57DA7J2QlyA_1790945492
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-487041c4c82so2500830f8f.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 02 Oct 2026 05:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945492; x=1791550292;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GUF14AtWHioqMuqb6hp7f6A6RAbZhDlhHrFpBFNr570=;
        b=ggi/GcTDtgdbo6ldVznJHwZFbGkvwTWRaZNVj5Fe5krYL7Pz5gtSVUWAtUH/YI2E+/
         YjP892RxqHN62g3TK9VaQm33rmjhOgsAJ0HfPqV462yfERlsjVwS5rziyFUXsXJECjin
         rXJMhmAB9FGpIF9GHyxh+scQYI+vRDmO6h4qyvAJrOVEyljeT/boy6wAlNHgzauIzQTo
         Z+59udnBC4ylHnJ8kZ+6jdk1d6i7cbvuyaVouQ0B45B3Ae6gbOnaeyvwG6kpvRos+bjh
         0g0Uinv44IhDmjItuCcVectY2FCpuyy4fFywxCa42FR4vVj+kzyiUlA6zU8dvUfEkrjI
         d9cg==
X-Forwarded-Encrypted: i=1; AKwUvByQBA6FoZuLOF/su0jua+RFdOAWlJQUVs88VIaENGpHcM8xcw6SWAKB97ebD5ul4WXyFUrkENDQJx6596Qe9X0=@lists.linux.dev
X-Gm-Message-State: AFq9FYI49b+0k/YMI3UePk574XFjwhcdm+eR4hRsiPr7DTNYOnlJGNKu
	muTs60l4Wtk9VGgPkd5YY+8LG09h8R86MmD4LokcrivZNntsyW8IVkal6W1C3NkczYhbmML3Nbn
	bVxCn5pzcr2IeWmmkcA3Znm/q2CQWHtYMZrOAxyZ8D5hiKcXCUpyk6XVhY5vhRv9rQUZquA==
X-Gm-Gg: AYBFou2DiTsFsH5Mkl84Lx9mnwg7XvxEbwbRd77AKQZFsXV7l3eMYSa4yz1Jtgi1A5y
	6LRjzBoN4024lk8bsagNRuHR9av+ZtnrSlKRFDpuVBIUQTIItCL+vjf9S9kYWIKBN6ysTYSIQFf
	D7Q9mOacQGxJ3tDLw1NGFu9tMAARr6YaAohcSz+yRFz0LgJ7JvHD3DmPncjX3djhPA0N1PookBw
	osqnEDCSOEpO/cLgws025OCw/5VOCcpOuEclq3qnpu54mgzNyHgLssWMC1UBxnCH7L/U6v5zYya
	C/DSwyXSbIa8YDF2N/DWXhpF9SjGnbebvvuxKcVYn0gk3qdRxQ9ZuZP/BnfQciXGrWaM8sXFDuk
	ojYWnmVo0sPGc50KAoGW3rFBh87ntgZNQvA9AhWkgMTWJMZZgsl+5gW04hC692WQOEw==
X-Received: by 2002:a05:6000:27cd:b0:48b:fc4:e84a with SMTP id ffacd0b85a97d-48b1271cdb0mr3218135f8f.11.1790945491991;
        Fri, 02 Oct 2026 05:51:31 -0700 (PDT)
X-Received: by 2002:a05:6000:27cd:b0:48b:fc4:e84a with SMTP id ffacd0b85a97d-48b1271cdb0mr3218095f8f.11.1790945491489;
        Fri, 02 Oct 2026 05:51:31 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253ae9sm4879135f8f.2.2026.10.02.05.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:51:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, ssengar@linux.microsoft.com,
 andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 5/7] drm/tegra: Do not include
 <drm/drm_simple_kms_helper.h>
In-Reply-To: <20261002124456.741011-6-tzimmermann@suse.de>
References: <20261002124456.741011-1-tzimmermann@suse.de>
 <20261002124456.741011-6-tzimmermann@suse.de>
Date: Fri, 02 Oct 2026 14:51:29 +0200
Message-ID: <xlv1bj9c6zam.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1kOVV-MFLls_v3l_-jfVh6YBR4Ss0EoK6kJmFLCVcDI_1790945492
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The tegra driver does not require anything from the simple-kms
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

