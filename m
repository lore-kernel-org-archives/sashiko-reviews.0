Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2963F54A7
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 11:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817709; cv=none; b=OjLw9onw3ivuk9+VQChf71gnjVpH4QUg06th+QYYsGI5wb+B+Sjz3g8qjZKtF/30QQqYOCuZIfMsDeIhVQZ7hSQYYK2fo4lA0UBoazuA8Z8HUYbdrlYcL/v+BM8GyAwOQflxgbtxsf6bTegImEycLRwWVC74+XBEo3WMmUSZVzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817709; c=relaxed/simple;
	bh=FFv+G1bNALM7Oqtoa8gRsZ+SgIOPgrI9YhEQRmTYKbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sD1tc0dCXLAxtyM3pQBOyBiMtwEhEOkZAUBvJXB0vH7kulchPnasLl6QijAbjZiopWmJJMdBP6M6cBs6rQbTiIih3vjiGEZvalJR9K8s6HRGv5+nlX/HKSkitR8KL8SQqw1AVEUmhMrzUs3V8mG2v1Gdtx7sq7sPCu6dnXqoakI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=il8vgD9q; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="il8vgD9q"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49270caa5c0so34364655e9.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 04:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782817707; x=1783422507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMWydGJ/5vZA6A1OvcajkdrQDyn8CAFtASnTxLQovUY=;
        b=il8vgD9qbKGUPAU6hVuRve0roClQmi+aX8sihapkoDJHiC1y/Vx2vs4j5tVQtfHCpH
         E6mmKPl7lo5WPlIm6m0BQa25pCL3i03rzBYDEbicBNg4bmSbhSGMNajrHjyWjtwn7ZJB
         zAsq4QNvXsvMOeRK5eIoI+jl4vM2o3Sw7EMj3diO4LBQn6u8whH5B+z9FtXdIcgzi58N
         JTp5Uaw9gSK9Aou6BIo5L0tGQhgleaMh6PrSdOV4Edv+r7IXR+5XhZ785VB1qQcsxGh5
         vgDLu6GiDeqGjqG9g3zZHTvF3vba8TGMiphJcKD8mXA0UQx3JjS8/SGKLH/DA/1FO7I4
         wPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817707; x=1783422507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XMWydGJ/5vZA6A1OvcajkdrQDyn8CAFtASnTxLQovUY=;
        b=HjyGMC30fnHoe9cgldoAs2sRoEz0VJaRY61TVFSuDlFfOXfihF9b6AKD6Ug2W8+uLH
         pvDJVbu8iVuK8A/cc+np2caER1+tgcMhrCxwentxnlBldnnIoNc+XAvTpqEC7eN2RVyu
         CoWdeyGxvvJQt2HQLssKLtXrNbY/fOi0R7uCL1uRVOXuPz7N9zEUJdQ1582jepURLuqP
         QXHk0vrAq3y8b3A4hUV0P1uP/EildQgxyTJfbhtGndIHVV6fsR+mR2or7qw4gwCbYtWJ
         gjIHYZhV/B8/l4LUHwxJ6GV1KLpF0kMj6B3Z9hT1QEn4xC8I3df0/3dilrdAHOdjr+u7
         ZZXw==
X-Forwarded-Encrypted: i=1; AFNElJ+2aHRLnYHrw1ajLl3Y0Paajji6Wne49OoN/i7+GrjvQWCa7YPmgKgVYRXBs0OmLzKls1pv9vq3AL9VVHyZAOY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIkmv6eJ131pVzJVGz5CgRBVsiNFwM/K1YYwhk4r240tUn6p1W
	FXbIn7O5PuSPHcliLg5zuTqS+AVUVu5oqfoXWI5QfNUnmhwcGPQiLGg7
X-Gm-Gg: AfdE7cmMOpcSwEx0lBnNcmY63xV+VWmjPiDDxRiSKr9VDFe6t2rTD2kDnwKMb1aX8WL
	6nocw1rGfobZc1ISq3fBw4MU/n3xB+EuSV11n+/T76YDvLRFSHx8nzxnSFJSkfLQgy3hmOA6a0z
	pEoXVXj2KcI39KaWWGcux6oQzJT4HBJhk3Kesiv0SnlwVpiQBedLHS1M1Vs5BASYofeb8f6n0Uj
	ewsMcSiU1zAqZlyLgvkZmOhScgs8Bw3VXdEf415Ztl6eebmehE/18yOt8GXE4CfUi0iuQ1us1Y9
	auVlS0S5uUz8tfww7SCb7lkHhV34Ax5JorJArRfmaD4w1cCEbOOgD9tlqq6Vke4svPUQb6wVQFE
	0cQZnz9SZT9iv0nTLxsIKl3YXrE3Mb9tug04sb16tOyKATn42WgKPoUwmb/WeyZvZq49ZhWQIvf
	jaxdUirJ+28NVpx1Vvrcz+B7YYVvo=
X-Received: by 2002:a05:600c:1f8b:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-493b82acce9mr47208375e9.18.1782817706582;
        Tue, 30 Jun 2026 04:08:26 -0700 (PDT)
Received: from anthony.local ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8d0462asm61791645e9.11.2026.06.30.04.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:08:26 -0700 (PDT)
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
Date: Tue, 30 Jun 2026 14:08:06 +0300
Message-ID: <20260630110806.23204-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87echococs.fsf@ocarina.mail-host-address-is-not-set>
References: <87echococs.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Javier Martinez Canillas <javierm@redhat.com> writes:
> Up to you. As said, I don't know were we draw the line so I will let you decide
> if you want a v2 with the tags.

I don't believe the usage was enough to warrant the tag, since the LLM only reviewed changes I'd
already written and reasoned out myself - let's keep v1 as is.

-- 
Thanks,
Amit
