Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5EC46D0B0
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 09:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795752; cv=none; b=Rgz+hFKt5dAIDQW2uMo6fSYlgL7nOUutvwSWxMfODVcq4NDbye8wcs9xQu0G5rx52AmbLBxSMVrNW4mgSxpol/4J6nSigxO8rLr9T07mwa06EIc/H8mc0wtKmG6T2eQhLCsLs2B9IJtxnPncZTjic77UjBTiogAUDGH+GDhx/Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795752; c=relaxed/simple;
	bh=bjF/sClYqCGL939pnFf+kLQX8zKbUrhgCJZgeEGIDLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kArsK6/eoiBy7JO6oB946cp2Ex1tv327i6ra5M68k31ntn0BGapnTfAve9rF2usEuSKaUpNDIjN9ehFWJsMnGk60ynx1G6yaK7OaOQmFauBchf3Gas9hdU3e5y+iMWJ+Z7ZrI4ZgykMvWTVojrbf4mwQnkysGGLW7RJs9VHko/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=JJVObZcp; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="JJVObZcp"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so815582a91.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 02:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791795750; x=1792400550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=la0yUppRKkBOXKqJrbZxqUja+1YySJSF4z3IR3acabQ=;
        b=JJVObZcpIoXKHI6Z1AT/atXMkxqU/cgybJyHCfmBKsJSEi6quYls8Oa/wd7lfIxAT2
         NNFmC8aflcoT7Cl1TaysNzJJERRmxE9uEWkN0vo4cXulU0XPegJSRcjua3LJxZ9D+kyd
         7ayxRXrIXye8htdxH8jJC/2jN9rIXTb0f/oNOOaaaQmYKmBJdlROR4fh/9cgxaacw5EM
         64xXLtvqUzPFgvZaSXQiYcE5zwX1C2h7QwGDgu8nslb2OAXzyIIAx7qCkqC+SDFgDFxp
         HhslZzYQNYaUJTDRN6u9+eLHazVXxDE4RQ4YWdTKyTdLkFKB6015TYa979zQnw5qfgHw
         v9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795750; x=1792400550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=la0yUppRKkBOXKqJrbZxqUja+1YySJSF4z3IR3acabQ=;
        b=zrtHsWHYE0eL+z/8CGOhmIZxfVjXsV/9R5nLZgbGNHTrmRIoxpBr0KATBMdeVgS8gd
         m9ZVh58mZrENDrUkO4ypmGXj42yofKFeJEfiHemr/GWVz0HlG7DdJhAqovdGKSjYtUXa
         F2OWHP0DKhjgcK0I1gXpvNGwNRrUDG1M/qjK19zHJ+7ahIRO9ilo06h2lu51/bLJFq+x
         SwK5+vJR/ltoganz3SrtksRH+Kd4B0U/9HM5HEbe22dX3g+JK2a+MbrSor9SYtuiCzIr
         EZ6abaFcuekKiGh3WoFHWbW7XlGXAeAPPCUxBN9E4v98HF/IwUnEDjBLyyJq1pojeMlY
         6R4w==
X-Gm-Message-State: AFq9FYKvPH0FBmqmupB3GyMUODvAGxD2eVovT4/RinV3M4ER1aaf4jTR
	OyEPmELVLzCjHRVYRdXQw2yq5NTcGda3IS6Nn2Sreon+xTYI5Qt8232KGUu2J+13tUe8p5WLLr7
	i4/tXDTY=
X-Gm-Gg: AYBFou0NSTl38h+vQ+ZFpkwbMeanN52iQs+humDIjgDBGBrxy6jaSwznW1ymJB5OlzZ
	KQ8VT33poy8MrbdC26MWevTJMZAMHa5RYqZp7xr+a+KLLCbhllb/5+d1h9heARsWBKJjr12moLR
	97pWffTKPqfaxDl6u5ldj0FLRit7KZ2wwfW1XYShx4ZUCIjkT8tiJuM8ljFH3i0P+jRvYbpF40p
	mW18eEDf/ZiF29j6Xe+2tP/XgZ0nSZREbqFWKk5xxEY5tZY6FIVRAZYMFSwOiGpkgCokmqt6rjM
	hRHt/S2rQnZgfYflfOlydR51OXwaqLCx+uULWVOJmlw5WqLKU/kG850Gye6RZpusIrVfM4V+Oz4
	4hWvEL5DApJhd9xhWWN0XHwuo9ve/FDKPoovKWxZfIj0ISrt6jkbDtK7cHtv9kb5ZfG6NZJi/o2
	B0cfqByGC9TCB7f5CT+kdNRDH6cCVbMQt+GwJ1p7GTJb6bUQpD08r6bvW2XLRA3sUmiX4ifjKNy
	Ry7pA==
X-Received: by 2002:a17:90a:d2ce:b0:3a9:9f13:e960 with SMTP id 98e67ed59e1d1-3ab3a98f4e3mr7312162a91.60.1791795749920;
        Mon, 12 Oct 2026 02:02:29 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3962f771sm7291898a91.2.2026.10.12.02.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:02:29 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org,
	ching2048@areca.com.tw,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: Re: [PATCH 2/3] scsi: arcmsr: check the completion index the adapter reports
Date: Mon, 12 Oct 2026 18:02:21 +0900
Message-ID: <20261012090222.2286418-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-167808@kernel.org>
References: <cover.1791789900.git.yhlee@isslab.korea.ac.kr> <f0e71746bcdaabb1e105297ed86ddcf2245b0c86.1791789900.git.yhlee@isslab.korea.ac.kr> <sashiko-outbox-167808@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review.

On the interrupt storm: you are right.  Breaking out of the loop left
the completion consumer index unadvanced, so the adapter would keep the
postqueue interrupt asserted and the handler would re-enter on the same
entry.  v2 skips the bad entry and continues so the consumer index
advances past it, clearing it to 0xffff on type F as the normal path
does; the queue drains instead of stalling.

On maxFreeCCB: also correct.  arcmsr_get_firmware_spec() can raise
acb->maxFreeCCB above the 1024-entry pccb_pool, so v2 bounds the index
against ARCMSR_MAX_FREECCB_NUM instead.

On the uncleared cmdSMID in arcmsr_hbaE_polling_ccbdone(): this predates
the change -- the polling path never writes 0xffff back for type F even
on the normal consume path -- so it is independent of the index bound
and I will address it separately rather than fold it into this fix.

v2: https://lore.kernel.org/linux-scsi/cover.1791792888.git.yhlee@isslab.korea.ac.kr/
