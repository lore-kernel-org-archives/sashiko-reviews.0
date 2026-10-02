Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C059F26ED40
	for <sashiko-reviews@lists.linux.dev>; Fri,  2 Oct 2026 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945446; cv=none; b=do30Yr+1F5enmPVjlenteYu4MF2EY0KYn6MqhcluMJ37Cpc8MU4aCacPaovJBDVmW3YI+CFkAwysoEq/Sd8IyZg+X7GQIiHblNJPROaRyqmb072MRFNhooRjqmiK80SDhEyGOcqC4cgL5zidpbg7+p1jx5W/f9VTebpLnwEodYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945446; c=relaxed/simple;
	bh=8LkjODUjCX5ThUzoqVO6sm9iNDH6/CxQcTpugXdKuOc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nmPn1ZeAK32nLm2BGnPzrfAPQJEPmXBsUS8eB4/FrV4JftS3/fSTDu9i3DrLviRmzegISvNwesTfrHmdVkUOpluiBn1y3Q7A22q660PAOvGKjPWcxvBTyzcPJ1vg4CuuOap/4nqTnNfSxbKoSbl0cL24dU3+JAAz/bHDmrbNlBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ejmaCF5J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ejmaCF5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790945443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bgkxJeBOF/HSWVBaDgnuL2peb+Evry2VYAsjv931SDI=;
	b=ejmaCF5JNKIrKh55w5oXP7Ty09YvgzkDFQScpdsgCv2ZW7dYk6dXca1ZZuAcXgHn2/GbAg
	YCOQQEv7trOsLUrir0OjcPb7IddJPZR4U1W/om6GZc1TYbvoO+J6E8jR+xu0fIJrU5/X/r
	gWYwLq9OhNMFi3Ewd09bCNJ3Q7xbThk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-ISgYL3CAN-yo4c3E3h7Flg-1; Fri, 02 Oct 2026 08:50:42 -0400
X-MC-Unique: ISgYL3CAN-yo4c3E3h7Flg-1
X-Mimecast-MFC-AGG-ID: ISgYL3CAN-yo4c3E3h7Flg_1790945441
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4870142f030so5342941f8f.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 02 Oct 2026 05:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945441; x=1791550241;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bgkxJeBOF/HSWVBaDgnuL2peb+Evry2VYAsjv931SDI=;
        b=r+JN+OEcw2JmV9Lw4qoHmxBS+iveZPVuxyqeB1JY0+nlU+NY3fMIYDChHaGygs+p5x
         MNWw3S8plmmG/YC4K2NQ0ck4P8fP2ApOo5hm2Bpo8f4X75evmVisezw1HJ3gS+JDb/g2
         48uisJHs70E4Uk/+tGnyp5SjBuBsPUttzMyEfQQeekzsnPy0E52mt0IRxSQ71fyk+120
         0P5sSpd8A1PQYTB4oeTJ4Hbm8AMISroy/1HCxxzd6h3NLTaE12jtcY9cy78fkvsSlEya
         aRwngVJR0hbPL+rNLnVXSLEQ7xia8RVLQMALr2+um4NgnVHHI1DkbSxAL9uEsTF2xfH+
         x63g==
X-Forwarded-Encrypted: i=1; AKwUvBx+4ux8R941cvH75k9v+y+Al0KjB4HLwvJ96gylonBQp3fkZKTU7O7P0BLqWHD433FL64EzgllRFFbJSXHvntg=@lists.linux.dev
X-Gm-Message-State: AFuF++m5VwK/IHAV5Hl4xpgAaMdGnz7CWW6wqMABTPeCC0ZFjsYwDgTS
	ZBThMoS9iWjFa4SEVH5B6SMH2TbhM7dHNG3FGG3sg8BjDuAWN6Ph13yDDnR3mD/ghkKX1fQNzKu
	6NpTlfmLYX9YR8N9ul1lLLZl96dEd9iQfKRO3YKsrthuWsAimb0GIj8BSl1ik5wE+HHupew==
X-Gm-Gg: AYBFou1acGxpcit4veVqbW9TzU0+Vv5VFjGAptcBlH7lrbcIckFLpMki71aJnwtep82
	XETWbKHvAwbJqAISFj9BvalaKVehr5OdvZEzlcYMdEw/F/aDKMiSlZ7zJFHE9kJbIs0JX2F8Uh/
	8hmbDMJ9ytEjAWmfnyGK9MX1BYDDmZLLKiGYvdIBuJI0hd5bmjVIGnrVBpWLUaAF6zs4Z6/CT6g
	qm14Tfgr1Fbh/dxdVXDN2J6w3ZWef0MEIr0aaPVGHENd9FvfZQHfajzCjDaPmzb0LNg/Kb/1ejb
	2fGNiANEliEwzEQmf9EPLUVzEjl4kI5zogl8RlV8NpHFapthgwRxGUPPk5Q4kNeQSTm5ksPoKna
	FI4L2r+W+teIoIFK2c3XKGD1eRZMgPzNVJA1gdh+2bziXB7cuFH84ZL1ByNevmhUF0w==
X-Received: by 2002:a05:600c:3501:b0:4a0:1723:2d8e with SMTP id 5b1f17b1804b1-4a0274f3bcdmr48922455e9.2.1790945440664;
        Fri, 02 Oct 2026 05:50:40 -0700 (PDT)
X-Received: by 2002:a05:600c:3501:b0:4a0:1723:2d8e with SMTP id 5b1f17b1804b1-4a0274f3bcdmr48922205e9.2.1790945440249;
        Fri, 02 Oct 2026 05:50:40 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a162e867e8sm30310575e9.15.2026.10.02.05.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:50:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, ssengar@linux.microsoft.com,
 andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/7] drm/hyperv: Add missing include statements
In-Reply-To: <20261002124456.741011-2-tzimmermann@suse.de>
References: <20261002124456.741011-1-tzimmermann@suse.de>
 <20261002124456.741011-2-tzimmermann@suse.de>
Date: Fri, 02 Oct 2026 14:50:38 +0200
Message-ID: <xlv1jyo06zc1.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HtOqCcDJw1_GljkGPXRiajEnbgZ-4EnJI_6RFzJMfYI_1790945441
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hyperv-drm gets a number of headers via <drm/drm_simple_kms_helper.h>.
> Include the files directly so that the simple-kms header doesn't have
> to.
>
> v2:
> - remove simple-kms include statements (Javier)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

