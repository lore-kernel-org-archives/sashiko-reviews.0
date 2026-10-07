Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF7D2C026C
	for <sashiko-reviews@lists.linux.dev>; Wed,  7 Oct 2026 05:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791350618; cv=none; b=Nu2iiMeLdKkWRdKy/Uf2ouZ/wUHFJQDvejV3/7rW0scYlAwfAW79ixYekDOEspJbpmzhgYP0at7bmBk7ZMZNEJ7mRricXV+wkcUuUaT1ce2koy693wbw3ma9Tx+l6FgY6Nc/yDrPBwXbajjWvlggZMdA74HopNIOw1nX7gJhr9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791350618; c=relaxed/simple;
	bh=98Toql8uimBayK1E+NqY8v40sZgD/pBFYRUHJ7qfUNI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iX2B1Hd3gDyZ2+KdZFXTss6f+oBECd5RvF/7z/G+QSg4aO2xGKG3XHeKy39ynVFdb8XzF/owuoX3jtjJoBAu6nsTqtXRsKcuxsOecoYT3P4f1NW2M76BjrMQtFbcaatyJFbtqC0qHP6DyNSBG9OaVX0FmyzZ2Bx5Z60/3QVFcKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1XiRFM3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1XiRFM3"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so1770765e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 06 Oct 2026 22:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791350615; x=1791955415; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x/R+pCgI2rA8DLvVd3Hp39WUeD8ue9hp8M4OoGV9/5s=;
        b=O1XiRFM3/ubqtn+0HKQ316gyY/pQIHf5npOI5SLUxei7LgsKwqB42jFrE7BaRk7sJ0
         wAgaqzFVq7N8BEeqs05MxElixGNnIm8wtKoLoklXo1oL3wJ3OlEcfLcvmXK3hdAEXsbb
         RzqPbs6mWtFuD9n9HEwMB7J++UmssXDrNs027cXjVEpBkkKGT89LAhSBbGU39QOe2MPd
         ehlemB5Am26pVsA4aU7eb4SdzVRpjXAszY+oSDSspCJKOrjRjJIk/Vz0kjxWR8udGxpc
         +hXaP+252DIcBC9s6BZ+DAo78U67roAr6JlSP0baLonTRIBLZ4eBdoGj5Vtu8wTcrEBO
         PS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791350615; x=1791955415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x/R+pCgI2rA8DLvVd3Hp39WUeD8ue9hp8M4OoGV9/5s=;
        b=c8NyAGx15ZIlpWvQLmWnlaVS9wUMa7kWYDgFlAkBE9t8wNGOZp+Q1jTdluiVos8o1o
         RBjlAGV25GisZCsW5KeWTOt/oqz4coKyTePgz260FHlKFV/PwLMdV3x40RqHyOoq8XUn
         PiACFkFae4dvlPge9sI3fh5hwIdo5szaduduA4ObtPZTgsdEo70dSjLTFBPfPeKJvPYj
         Py3QXuyMr4AJZAzHdMml4rbrTUq8BB3kN5Cp38Ksn7nORdw7o1uQibVl3+gO81Cwef4O
         vJYSwHi2oLX9RzWY9RLRkEw41l0sPeuM+qbGRFyM1L5uzAy/wNoVZiCuW9GPLw2GNSA5
         fJpw==
X-Gm-Message-State: AFuF++lu4Nv92nN5dVzn5pgA+YEuLdRylvEVytGR9d/dr4QXD6BkkR2O
	pizs/0FQs/GtBKiel9UWTCFuKG23hwX6zXeukB+g4vfWskYxpOQ4iBA0Bdi+FPPu
X-Gm-Gg: AYBFou3gosh6uWhePzCIynlsqrmy4HjHkfq1VIZE7Y+nqxj8TWuRAUzCpqmKSHzm8fE
	Cjvl+hbR6yCsuz3FxYrjflRF5v8yqk5QXTvoFeG/lCE/xPj1NkOVwquFHLkRX4Y3Q/WHn/Ea2Ba
	6XAjuAg5sQbTthXhILHYMKrQ6f6pXpBm7QwuFwwnOV2PJW4TRSydodd8wEXrJHo4+Tu3NyVkD+5
	Z1+soEJaGbJTi74S8KfHQGwTD8/qFT2tX9FKijqFqSr2tLBM1HVkzdjNuattqva26LL5Gjar8FA
	PsxgPSpfIEWErZ4QvphZ/ypUWPV3+FW/lP0qocFXKtkuhTKgBNhbnmJ38yZaf1Hg0Muo59xT3fj
	dwDNX0TUVj+H1+7GWcWaycOmNU0XTuaXg4sJNlpCLxaUZyOwCyhA9+NP5SZb7CryE14PS5+ztqG
	hfIMSyddizgLBfnLLqyFAWPMPoAonalN0uhHraJ/Dxw+svcEC/7+N3tBfZL/GiCuNvxr31E1H9T
	1dPdcbee1N54jk/kg6BfF4XS0ziMFQL3eu8ry2JVH3+hinHyTvSTjc3Ig9f4HY0Bv9XMIySUhYA
	9735KMXhLWyGcN9wV/S4r/JG6OstenKHrE47AFO/+GlO0vnaGfFMdS1qOkY4gVBayq4XOJtM4e9
	80ApNcDc=
X-Received: by 2002:a05:600c:c16d:b0:4a1:7bd4:d07d with SMTP id 5b1f17b1804b1-4a18067f68cmr11531475e9.34.1791350615217;
        Tue, 06 Oct 2026 22:23:35 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a1e1-2201-60f4-32e0-4d59-5772.310.pool.telefonica.de. [2a02:3100:a1e1:2201:60f4:32e0:4d59:5772])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f54a55esm34907585e9.3.2026.10.06.22.23.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 22:23:34 -0700 (PDT)
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
Subject: Re: [RFT 4/5] drm/msm: Convert iommu map/unmap to helpers
Date: Wed,  7 Oct 2026 07:23:30 +0200
Message-Id: <20261007052330.39998-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261006132545.8BFD51F000FF@smtp.kernel.org>
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com> <20261006131000.81501-5-robin.clark@oss.qualcomm.com> <20261006132545.8BFD51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> By passing NULL for iotlb_gather, does this bypass the IOMMU driver's TLB
> gathering and flushing mechanism?

Yes. On arm64 QEMU/SMMUv3, unmap_pages(..., NULL) returned 4096 after
device DMA populated the IOTLB, but the next DMA still reached the old
page. It faulted after an explicit IOTLB flush.

Using iommu_unmap() invalidated the translation:

	return iommu_unmap(domain, iova, pgsize * pgcount);

> It appears this replaces iommu_map_sgtable() with a call to __do_map(),
> but there is no declaration or definition of __do_map() available.
>
> [...]
>
> Similar to the mapping path, is __do_unmap() actually defined?

Patch 3 defines both helpers. msm_iommu.o builds with all five patches.

Karl
