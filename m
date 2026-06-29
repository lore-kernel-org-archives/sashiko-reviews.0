Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259CF3DA5A8
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 08:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782722644; cv=none; b=kD4M7x3QYX9hauiYqurpiGVzba+S6/Ytta2191dHxDyna70zxEp2I0In/RxUpoW71sVT1KWZjS2F/6p6JWeitX6o5FcqosZUFwj7LuGRjA0w6V3XLPgY0HihQpYy6ZUpn/lGP9YEjOcSHnnvH7JfUO/DetruRMVOApp69z14aj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782722644; c=relaxed/simple;
	bh=MIKe3kWQjK+xmv1ipQpshiw76Ja4PFM8nvJNMM+vmgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T2sbZI2HsojhaJJuJjW3cstR3SkHK/EAZu987vwrsPQsgfvuD+pRvCfUcP9N75Xiw93PHvFjYY0ll3gZXt4JKgshBY3918AWqTSOJwpKy4olaAjLk8z4IVmIMp4+pj0wbaTk2q+jQXeTFnXiKrMfUrFcs62uSn3zJwHO6vMksZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8WM4+u8; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8WM4+u8"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-470174001a0so1195203f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 01:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782722641; x=1783327441; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGm9QONZukO2Q5rdaZt121dw8G3tFHNBSookGlxPwSY=;
        b=Z8WM4+u8DW67G+Q/hkbwK9vdilx6SqBt2eITHaGw4+JEHEKKr/XbrexjBbdnUkgSy0
         7pZ1M6cVKd2/Q0Iy8PVVzA7RhJ5jc7zzLf0Q/1+V9S2mozLFHretEGMpCoXElVtvMAwp
         rIDdKzIbn0OLpuk+Bi2tvPTOo3YOAihwYBUsBfcbo7UvRiyIaBMTN/y3z16944t3RYQ4
         QAZ4Y3LqvOX1EeDy9kt0kKIj4Mw3ZAiynaRUT1ANxkqXXMPkG/iGfRh5cvMRkAWmczP/
         q8cFkvO2nk2bs2cSiQsIjSrmy2AmNZ9qNGvD0SB7xS4oGT4kAFmW7KeprbFC/3DzsqNn
         8M/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782722641; x=1783327441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PGm9QONZukO2Q5rdaZt121dw8G3tFHNBSookGlxPwSY=;
        b=kGaBbOHyDZhQIs0ztMN3uk+dv8bfHRt2msa06I3Yj9V/yTLoP6QW87qD+PS89KcAfU
         jbaEzOr7fPQyl32g3Lev5SJ8VqvLhKaNt1aGL1Gh2+4TB/HI4CY3AMgtAMBrIZcfHgi5
         8PvdxaC35JgsIh2Xi6mxZmH90ZCyn0p/urgmGOL1oy2CJzU0jIisImjKi+m70FnzAGkP
         IBfG/u8fr3YIKCxgOe0WVfmIZd10I5JAsvUkh0dzMbikOHaVQzXIKj4wzJD4qyjQRu1J
         4tWdJY+VqLCoNgjb2vuIuaDhiV4roO3wzbu36F8I7zG+ZerPFrpG4zOWvdZxv0esf2aa
         Vw+g==
X-Forwarded-Encrypted: i=1; AHgh+RqezJ3fz9Ynt4LicTBO1VrAgeYhy9XS/GFb5izUr+ToFEswsQem9MkVNWtSc7cVY0l6HldXmS2SjZqVJ27Gvao=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9chPm0Y5JMEdZFGNyZZ1f3ZDuljBfAyaKagSzV18NW3PtsIX0
	ecTlOtPaJ/U7lx/UQw2MhlETRt2sNv7qao0rUC2iZYNO/8KlzH1xD5r9
X-Gm-Gg: AfdE7clerRBzbrt8ZRW0io28W3C6NFjuoF5LKBrEQauZXWyB63XvZCMXZz88zmOWSlN
	pYU30aJ5EdedNVmv3uzl0tqseAjwptaJLaYVZsLAYVQ+0OqVeH3Zi39ym0H+04C8DN4L1eYxSCw
	568hW3HBDgdULQlkpDP/mLCPL1ulX/2VZCvdJA2+VYYfFOIKS56r+m0O1h16IUbEKKoY91jLZaX
	ZPMgOcDaAGgp0oK3QoT/LwttuJ0lhDCxNk9m6/CJn8Z71ba4TLXD7dLxP5EB1Xg0zyoWTJE+tXb
	MJrlLnNFrFe0HOrPUErnvAIe5wTWewv1Y9GwL70nbmk9iQ3FWzGLTFtWTEfOXQ9piudmO3/vhRN
	VXDAGBoDAMTD0jzKtncGx7iZvHPmkm2SkojvQPW4kbxmB5gPBifj3yZKD0MFVFfKHoCZJcfMXgZ
	wfhgp2xVlHmH/T0L95CvmAPBx+X+g=
X-Received: by 2002:a05:6000:4210:b0:470:4d27:97a3 with SMTP id ffacd0b85a97d-4704d2799d5mr12518285f8f.1.1782722641174;
        Mon, 29 Jun 2026 01:44:01 -0700 (PDT)
Received: from anthony.local ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm41208583f8f.5.2026.06.29.01.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:44:00 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 1/3] drm/ssd130x: fix column and row end address in partial updates for ssd132x
Date: Mon, 29 Jun 2026 11:43:16 +0300
Message-ID: <20260629084317.10265-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260622123631.8B4A31F000E9@smtp.kernel.org>
References: 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Jun 22, 2026 at 12:36:30PM +0000, sashiko-bot@kernel.org wrote:
> Pre-existing issues:
> - [High] Potential 1-byte out-of-bounds read past the heap buffer in
>   `ssd132x_update_rect` when device width is configured to an odd value.

As stated in the review, this is a pre-existing issue and is not touched by
this series, which only corrects the SET_COL_RANGE/SET_ROW_RANGE end
addresses sent to the controller.

Gentle ping on the series -- it's been about a week with no comments. Is
there anything you'd like changed for it to be picked up? Happy to spin a
v2 if needed.

-- 
Thanks,
Amit
