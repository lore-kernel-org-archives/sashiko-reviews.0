Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D984280CF6
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 09:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782813379; cv=none; b=qC28/Q0rtQnSCaq2lD7YSnIjGMQlv+wLXKJO7RHBNv3ard1gxmm9Bp/lhM/miZlQA6EPir3gAD5yl+PNW7L4+nUCX4o0NjN6qKL4xGbnfiWpkTG4wK78xWMvwU1Z3yLu9RwU1GU4GSmeBXMSBEPPpJM733fjELopWhd8X2SLKhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782813379; c=relaxed/simple;
	bh=tfl9fAqnZDxJJ+EEX2u4k8zmk0YPDXfQCrnd0qm2ZlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tMUvnnmzV/X34UjlDPTJR4Je8BWHFzgbfeDGSuO9C51B3LX8ca08uMPS0G2oxIjM6xhfQhi3yJdqJhAvIRi4CLZ1MUxJx7H5ZbhFYTBHipJD5Q6yVcRmZimliN/ilq3h4mZ2I4uT91F3dAXubcShBLx9MH49LAH06Fz+Bf7OzV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRXErK9P; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRXErK9P"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so2679445e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 02:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782813377; x=1783418177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pxr0Kr4lzLvN9nvux/U8V8k3z8ULnbsk5lqwt68cCCE=;
        b=HRXErK9Pbld6MUjL3F1kDnQDfHR3V2KdoLRUOiLUuKwqf6UwCbWBMVBaIxrpJAA6VK
         dciS1ZZgO+BBizgZ9U3amheitnVMFAgnp2lZzJaDjVEt8VwTYKzzYEOIIBb3cc38l3RT
         jO+wbWVyhW2WjmlKMzPxr68OsHuvIhY9eOdcmc9yd+nhBm1wL0TU4Xigmmnfm7JRc/SE
         HbSapNpt1DFo/GJrGmocOC1H8bm8BfO9H027Y8kbQQLxbcL/ee8QETO0PjmoDto+fi6X
         D6hvxdBvqxrQevgHZ5fqzU8MOEGh3z4CwtuCD8KozHmeKV333feLZEPgmLL73Ml/CCxl
         qhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782813377; x=1783418177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pxr0Kr4lzLvN9nvux/U8V8k3z8ULnbsk5lqwt68cCCE=;
        b=c4QgTpuy2PiK4cGQj8g4Q3/ukTcSF5VXtE/RorLTQAoddvgI7xHoTLYMZmmR6qRTCq
         +cbrzmoIZU2U3DDLKlrXh7EBvlmM+Yl4EeRinkjxnXusoVGCGIK728tBpL0sRKXq55LL
         yLBGI8p9fLo5T1ykDmU9pblLba4uP9Fj3YBloC6BvI+s1L6IeBlCfgtPhlEy/DAPz0wu
         Qb2BsQTrYFTlv3PAelTcRfvQgcAKhGl3HXGF8FkRcNxQIZmS6p2/YTyNVEOksB7JkYrs
         JxxFzsoYLE6AcWsiwwOvDINI/VXYM890bXy582xQdyy+ZEAs8XQy8iDv0rKq8iM2Rz7Z
         BOoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8t0U6mgToWbQShKNdlBE0WSu4ZGwYuVSWxrpBAEfF97Uks+Qf4vYdO6IgKTDwu1OuQ1CzptZMeQE50aasQAlM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDaCDX+9PmNyK1dCoYPmgLYrN5X0UbF0BzBYHMaD7wlng6E/8T
	i003ryWWle4VmvKVFk6xWG3azm24GEQSg0FXGCmTFoirBbnW/HPwo7rp
X-Gm-Gg: AfdE7cncJzFO/Ku3vDAjiz+HPL9b1Hfk4Bcn/Z7xC+YrZzswB5aQ9jVOsPIBFcMSk85
	CNe2OZO9t0i9habrpLs9QOdPgGGKqOK7nY+9LXBouBlhcl4itpgALohXCFCGnAQwVCMxjDe4ylk
	iEqjySCv7phXiYM7gRWrl4GqoAG2qaT56SmC342vdxoTwTm/3zHam5joLFtvqtXZU5lneABZXxd
	joJuo8W+D0wvT9o/5+wWedE+gw7N9mK8v+7c3Un8Dz4eTXz0zcZHXct4JQvaNgdAfWXiyLNYQ7H
	ViAbQ18/DusdNuTMr3H+mNKAyUf3lsdQjPLZPHNV2wVZh5OrOa5t8ssQQu3G1hk0+ScqXNJ/dKC
	+Fa3KqnXU+mhjkWfouqt2eLknC7JCFdob1wntWjE7/nLNQIFqparRh5zVsmJVcYqGZ/Ii/AmQ9v
	/D2FTES1K63MHCOPuuixMW4wYm4AU=
X-Received: by 2002:a05:600c:4f55:b0:493:b4a3:5ab0 with SMTP id 5b1f17b1804b1-493bc741b67mr16274405e9.13.1782813376697;
        Tue, 30 Jun 2026 02:56:16 -0700 (PDT)
Received: from anthony.local ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8cd8bccsm61379375e9.8.2026.06.30.02.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:56:16 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: javierm@redhat.com
Cc: airlied@gmail.com,
	dri-devel@lists.freedesktop.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	sashiko-reviews@lists.linux.dev,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 1/3] drm/ssd130x: fix column and row end address in partial updates for ssd132x
Date: Tue, 30 Jun 2026 12:56:00 +0300
Message-ID: <20260630095600.8392-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87mrwdd8t5.fsf@ocarina.mail-host-address-is-not-set>
References: <87mrwdd8t5.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Javier Martinez Canillas <javierm@redhat.com> writes:
> Sorry, I was on PTO and couldn't take a look to your series. I plan to do
> it this week.

Thank you for the update and there is no need to apologize.

> One question, though. How did you find these issues and came up with the
> fixes ?
>
> It was just reading the code and the datasheets or were the issues (and
> fixes?) identified by an LLM? If the latter, then you need to add an
> Assisted-by tag to your pa+tches.

I found the bug and solution while debugging the ssd1351 extention to ssd130x.
I used an LLM to make sure my patches made sense and to recheck my patch logically
and I wasn't sure whether that was enough to warrant the tag.
I'll submit a v2 of this series with the tag - let me know if you'd prefer it handled
differently.

-- 
Thanks,
Amit
