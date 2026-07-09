Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2766B32ABC0
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 13:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605485; cv=pass; b=f5oE5R2WJRT5hLEmo4Y2dlJrM9JtP6Esk65fL+SWPbXgg+302c6ShUNpbWK8RJL52f49VD7CX3bwJsZf7ntSLLSzaAz1/MiGJr2lmZyrE0h+UETNfU8aKoHspTsyZLHyPqlFq3JSdnWwAp2PpRZ2AUOE2wjtOrmtKzqGD8LAngc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605485; c=relaxed/simple;
	bh=r3iI4FQsX7ZhfhRt+a0Quj9D6BAbfUeo2lIKS5+h3ak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+OuVIbKIBM7W4gIXHf34qUSXLvk16uZ7xzYI769Jj/JSqwi229xv/AwRRPg/ZeEREeQs12Fih6+MbMVlNKB/KPUDbtg4kbjRSOc4CefL40K+oAi0/srazW/NmslsMP/bf1jPpXSB5tKgmOHg5NyBtuwb+T0vKamtRwHtvygWKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOyQLbMH; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOyQLbMH"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6611669cd16so2337931d50.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 06:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783605483; cv=none;
        d=google.com; s=arc-20260327;
        b=G7IlPP+V/hjPm3KA4fuf8m5jAVW4n3zGnkT7I8Hti6PpoxBaRW8eNcm19HllU26GQE
         RjH5dt6PdI3c9kaW9xSprqkVPkcP4pq3CSxnogkY/uh/z+tmplctTw40SkTL/mN1Aj5L
         Crc3uaVWNSX3er1FEr8e5apyaMyuoG7WVhJ5Nf2FN4xzymOZFEk0vTcGYLy4Sep7Z2Pr
         0olBDkAxPi3b0OfSqRl7jawc5oyq+f1If8FVdDwSY4HO5KMrbrKzywSTJyM1tZEJDMiR
         athmzpWKC8CdoaqnMesM9l8do0FDY2nqfAK8875yyIIkC2npG64o/oXWEvClc58Zt6RV
         q1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=r3iI4FQsX7ZhfhRt+a0Quj9D6BAbfUeo2lIKS5+h3ak=;
        fh=gyRs4Z/Be15EUi0f2i3hBZU8HBDnr1IR+9kXhRJrGTY=;
        b=PsEIajaVSKGp76vM8LvgZBCFEy+ASvzsqyP+NLKlHspfQ500t98otjvF4v2YWeHxoc
         P8pbxvz0ob7hmx9qixMOYsiOTK1Q63ekrRy5Umn9c5TQN17CQos9Uewvt+pmTE5GoCMh
         ACaPQqeJ+/8VvJcxPLwS1FcamYPP+CmvsSXZciK9ckO8WQjnO2mjm/oKSpSuMq73W4xf
         3K7ad0pIAzOQ0i9l9+Mk2ThjTqQe8hesf8dp87iC0fkOoQah1/mS7yD2K4E6IB3HEdaQ
         tqnNE8B8iGWZrAWqq6tU3Mw/AKgrAy5yicrwRtkNrgapsIh812szeauih9KpYqdbOdDU
         kL6Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783605483; x=1784210283; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r3iI4FQsX7ZhfhRt+a0Quj9D6BAbfUeo2lIKS5+h3ak=;
        b=YOyQLbMHzh6xhf/lk8bpvjE6aYVvvjaFAnqffCxJI6k9fUXspf8ddIuAU/+hsETD/K
         YXQM+4QWvqQIPEBmLCdNl2Pc1gIC1fYg6siySJ5oGX9hlgdi0IqldDZ6X/h5lvUOFRVm
         s1etcVz+sa3crwbHG+eW23Xax78OFFffHMcjqA1248tGuihkz+ESUhtaAyzNz8/68Fr/
         oBOXoCyKdYOiycnD0an3ZjxGPzcVsRddzEiP9SP1AG9k/gIIc+wagL4F0mAeY1gmS/JS
         HjuZCVDtlc8aWBwW2mJEIwIIx36zrVRP+ju99BPIGD0KLN0gh8IZBiYfOGSAWdD8w2Y8
         N6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783605483; x=1784210283;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r3iI4FQsX7ZhfhRt+a0Quj9D6BAbfUeo2lIKS5+h3ak=;
        b=qJbIvMzwJ76q6+yvPQZC5CEMbXHKKQx/iQiEty4l+DTErCyl87BXBSjQnpoCRQJ7pv
         WDUUTCLoS75brbIwVr/rtJXl0hM9KMO+Hc6wiGkDLfJhzlbkv+vSwpYCAzdNslExrvfL
         VNr8VzdAt+ENPxpd61POl+jEt0suiXtDhTXdAC/O0Y6w/oKXfB3Rax5+xRbeRxy1BySm
         8DEpW24mWBgiWpA2RtG6XVdwo8ICg0txhHViY5qX7nr1tuo7dzqQAFWMmFwp4miwBvWv
         5Zd2JPAZgvSaUfPNI7n7QGJKecKWdDYTUwowqkqAFzl8XZFxDSglEIe08t28SuJClk/2
         w/9Q==
X-Gm-Message-State: AOJu0YwR8ZQgAQ2ix88W4oc+1s3/K5y3S2Q0W9KFEfCi8FzE7QehiVF/
	YsFwgxbr4IS/0uv3jCe2jFni6aTKWLJzNnoWrfcIbX1d1PyOPN7p0Yn98qVP9emSHWVMd/tFISL
	Yu63od00w95SgVKmyOFz0UwlurbyJN+fYF+sQ
X-Gm-Gg: AfdE7cktyS68TpSLjvu9XbTomLYzB629rr7rxM7OfEqy3iol3yf1fwXKOt+Z7Uq8KGz
	gLdnxjdFteXDo4l5Gzs9PDjJaJpVtFx6BMkc4GgHQxOtwCA5peHr1Apo+90459QK4sKUF2m2nsf
	C0UagAks8CkA/i8H5Q5XTFPx4oIJ3mrcHGjzhgS3pLCYQNvPW7nqV4wCt5pYjR5gpBWrWQy+bKf
	mjI5damrQbjfTuPEu8QPlLHNeoxYP/6xx67eDR4onbzClVe+hiwbtT0jMNtqtW3Xv7MMvZUvciD
	EQbpXJlAbEO/AJyfxe4N5rh163E=
X-Received: by 2002:a05:690e:4807:b0:667:770c:f88e with SMTP id
 956f58d0204a3-6679f1593e4mr3775472d50.45.1783605483239; Thu, 09 Jul 2026
 06:58:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702155452.67594-1-mertseftali@web.de> <20260702160459.9BC4E1F00A3A@smtp.kernel.org>
 <20260709091356.GA2045740@google.com>
In-Reply-To: <20260709091356.GA2045740@google.com>
From: Mert Seftali <mertsftl@gmail.com>
Date: Thu, 9 Jul 2026 15:57:51 +0200
X-Gm-Features: AVVi8Cf68ZmUY1hV863gHaHYCKH7BG0YX2eqC3s5GArbHueZriTKzMhUV2tA6TI
Message-ID: <CAA3Noorhmur5kPKwUP1_A3MmWoe=+JbekO6mP6cRy5XNunh_Bw@mail.gmail.com>
Subject: Re: [PATCH v2] leds: pwm: Annotate leds[] with __counted_by()
To: Lee Jones <lee@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lee,

apologies for the wait. Been quite busy but will prepare the
remediation tomorrow
and send it straight away.

Thanks for your patience,
Mert
