Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20E03B9D80
	for <sashiko-reviews@lists.linux.dev>; Wed,  7 Oct 2026 05:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791350375; cv=none; b=srDU9bxDGZRgK4GL8EztbDOr7BVaY+LCa6oboDsrqtAPQGwW/DEW1hftHQpoVned8vMskkoLPnYAmBATThOsZav66IjEq7abtcoL8pgOYSYwz10P+pcVevhRcX0lc3TRD4C7eDLWOKwCz7EgqT5KJg7p4OSNhaNuMeIgLbgd3u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791350375; c=relaxed/simple;
	bh=pEBGEIuvQXUOhw2qs60K5A3Yyo97btH1M39qmx8g1LA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VFcNV37JT+XiyDY4CsBa+sT9thjprO1zOxTazYt+4VUVKmZLG+74aHVYY9kuECgvUFSalB9vl4/qZKaqD7q3+P6AJEUGlezTTuQz1lxzaSQEUyKtT2/uDITXldEEZgmhE9fChHEE93jf7aqFX6zlv0sfdmEfbAA4jGdgMp7zsJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQwTz8gR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQwTz8gR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so1743745e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 06 Oct 2026 22:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791350372; x=1791955172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pEBGEIuvQXUOhw2qs60K5A3Yyo97btH1M39qmx8g1LA=;
        b=OQwTz8gR6YMlsFtja1k7IWElLhPsbyrTDwQFYfGPCWnvwWFRb5HjJZWw+6z9BLETjF
         6Fj5nxMUFLzXNRImv7fIQKjOb13m50A0MEViOFCjNvy/ga2M82rb5B9ossx5EQ4jWtHX
         4WAWw3NrhzCjPkX/80g5e8Lm28lpe9HaYZed1pZ2ahQDYJij0Pd2ILqj2EtHNOGIDnRo
         o6fbxOFNLNnWRulY+O6cl5AVJW93kW7CLXe9+/p96VCy6iJ3UfHRAxcEaQibLS4JR4KH
         EZszA8N64Hez5RRRG73magQJuvYTkIg7f4c0nAH4CNwWN9VmGEPuuXEuREY21/Qtepnn
         nJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791350372; x=1791955172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pEBGEIuvQXUOhw2qs60K5A3Yyo97btH1M39qmx8g1LA=;
        b=WdXO3sHVcfAr73bGha2Snq8MpzEFnDN5aTicQFFWxQ4+5CYjeBKyQx4NAZ3TM0+ZrX
         OfG+cq9sdC/nWHa5eDCriKMih5monVusUA6RbAMi8UMEy+CIx6o/oZCbap+UPFcLdSym
         FYr+EWWLDoxFfhj+ltlsp7FNUs7qFn84JvXv/5lYvcUhSw2wtnyV/YEOSOfwRkRJXBUz
         uWXZXCCJJDxzQcmkwTq7rjJW1cFHwqtYiBEvWgPuQoMrjrO27SAe1yp/HrRQm09FTLfE
         L+SQkFylJQAkezhgrDygDdCYrHpQq+ZU3aPmc3/PMU0OP4sbGcHpZqXrsVovyKDRUptD
         ER7g==
X-Gm-Message-State: AFuF++kHBMRS6j5H8lNhEZX1b7KmgygHjiD8f6YL/uDZS4aSuyd9URZh
	dFiAJVn7SW5yMPQmgsso7TkVhXD9IpeFvfhsOS0bqA0T242amL6v8BgMnonBYr/l
X-Gm-Gg: AYBFou2NGdrxY67/3WPRcxLhlSu58RoXuaKr5C546cZFXhJUl15fle08jAoXiL/2MDU
	QzVw4XRQj9RIZpvE/LyULdUpO6NUC2+cH5fy9Kq6q3ZJ2hq2Otf/SQ6ihh2lD7Zh1ztf+hfJvh/
	4vDYcVOrB6hygvEUEUWrMAzh7U7YNWzW8aPV9asq8aMkN7ze8r2YWHFB/KEhXoBcLEKVwhNghjo
	vlMA8J/Cy7nd+8WANWnZ/uFOXr8Ze1otGIKIYvJO2Cu1q2cX1OWU55m9SspLi//fWL7EoFCQKhf
	rDcuFRbq/w1aSfP0X6rGaIQSxWD2kNk11t80SRJTrbn7K1oseLkiTMTtc3zmIWufGQeOEeAeuEC
	/jL8d3IHuPmjmgrGBkQzGubBbbBAwY2OitXkZZDmiqA5nAP0+xGqKt1hkR9Pi8aQavJEbAPZGuQ
	dZIqoGcfsAxolMZ0XEK1vDskdu5WJjtUPK+tinNmWa7/W0n2a+Zd+LonsDDlWt6yc2i2RUVG8Kg
	k6DqN7Zs1W15KFZRwiylOEypI04pHz7DuoT5SFxZ9XGVhMOntDP4h9OMuhnjplh2TKYg7A+8rNy
	q0RA18P3y0fMaW+hQadmdZIkSJRc05ouMhmCZaG65KvoFQev+4tnEBNjVUI8KZS6MvqNcKiIQdU
	iy6Hgjxk=
X-Received: by 2002:a05:600c:8105:b0:4a0:20c7:6d4c with SMTP id 5b1f17b1804b1-4a180085f90mr13193475e9.0.1791350371849;
        Tue, 06 Oct 2026 22:19:31 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a1e1-2201-60f4-32e0-4d59-5772.310.pool.telefonica.de. [2a02:3100:a1e1:2201:60f4:32e0:4d59:5772])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178a175aesm156822265e9.2.2026.10.06.22.19.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 22:19:31 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	sashiko-bot@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFT 3/5] drm/msm: Extract out map/unmap helpers
Date: Wed,  7 Oct 2026 07:19:24 +0200
Message-Id: <20261007051924.39963-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261006131920.6870D1F000FF@smtp.kernel.org>
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com> <20261006131000.81501-4-robin.clark@oss.qualcomm.com> <20261006131920.6870D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Does this error path miss an IOTLB flush?

Yes. msm_iommu_pagetable_unmap() called iommu_flush_iotlb_all() after
rollback. __do_map() now calls __do_unmap() directly and loses that
flush.

An arm64 QEMU/SMMUv3 test:

- mapped one 4 KiB page,
- hit -EEXIST on the second page, and
- verified that rollback removed the first PTE.

No stale translation was observed because the device had not accessed
the mapping. This tested the low-level IOMMU sequence, not the MSM driver
or Qualcomm hardware.

Restoring iommu_flush_iotlb_all() on this error path preserves the old
behavior.

Karl
