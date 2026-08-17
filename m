Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EED3D1A98
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 22:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787005487; cv=none; b=mK0ec/LuGlyrp2KvymEC25b7ubBM4d61OcUNOsr2t6ZEISflSLsvEbqHJGLndi5ngfiDoAc/WG7819dlAATZwmtj7N//1RSVfm5MCPs5Abtct3e4s8Q9B5gdOvkpNFR3heftkWXqNHJ/YpHBuABcQs2Wu30HvflvjttKmduKKf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787005487; c=relaxed/simple;
	bh=PmyumuIbO2ebXCMuhpUbu+i9E21ps12svObOY0TjhVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JvHs9n7rniBKlttBDSC25WCad3iUQY0LdwsB5BzupMWnIhBpoWrgutFAPfS/tniR083+ty3zXfLJsuZV+iQE4OLjJR59g6819cVs2sJVXg619NrsBXRx2u5N38wD7d653umv7ss0mRor1YCsRn9tjGHrdIsOsVL/YHu3+3jDfSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Az14KtIm; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Az14KtIm"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7f3faf2b081so1786823a34.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 15:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787005484; x=1787610284; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PmyumuIbO2ebXCMuhpUbu+i9E21ps12svObOY0TjhVA=;
        b=Az14KtImsbL5EB+O54XFSiuDSqOh1DKcq6Zfq8oud9SJ8FQDYHUGv6C2T4xjnROpj4
         9y1PD8uuGU6ow7mJye4a3UblyFVrJ8UdbmLc2QblKlzi7L1PwcKKIROl40Uzf4g4edTn
         k6WgiQeunOCIbFMxuHWD6TySFALOA+dFixMJ8w5u1Q/VEt4u7HCeZoWi1gi33wFl4vls
         53rxq6dm6DJl+Z1gZA74cy6+ZMrC9AQhkDYPdhM3dlXYftu+0Appd+BQ2+ZH1ATofl0c
         icSSk04bGkj3ZiXCZnrRTW/p+KjSrSjhQXMgukdwO4eex9N6Z+nxjbixqNcvyppdSh6j
         GOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787005484; x=1787610284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PmyumuIbO2ebXCMuhpUbu+i9E21ps12svObOY0TjhVA=;
        b=evct/ryHA0VJpdX3EjIBtpUd93uDJeSmZGPDB782gTnNNn6rYJm7J5hOkEud1dpFuJ
         oX9fi++CGC6G0Dpmv+R+P8O3JdUP/IsP6yRaKwTpXzBtpVo4YsHprG0lUYv4Dch8GXWP
         Ja3jySqWjcvLsjmTRHrhfyyK6zhIX+KmY+u8hOsetCq189XoJ8lVm6YZsrWAyNRseXxe
         c5s947+nTydj7yw2mJ5VPq/+BMD3cY7m/DIX1GSWYBQsIuu3kGQsuG27ZFWi9/Lr3IQB
         8PjkLWz6i4jT3MeaC2pbTf/S7zWcVSQjRmkmQvJU8qVt3v6K3gb6jKUN4J8ZRXs6KCkm
         HI0Q==
X-Gm-Message-State: AOJu0YzEe1HAW13dSY2E5Ki7jRFxYCD9c08i4x2HLCuwJ+5sGHXTQdfi
	3QoqFG5zAyJ/bccq9F3ws9II4kqvoTJp3RaLiP9PQiHoCkFFd58NMpK/4GsmXk/dBbQ=
X-Gm-Gg: AR+sD12V3PtpwGxhEUs9qN22cunm7z7qmgwJ2b2d4zUlvWD1VbNskqdt9/9wnnsI3vF
	78hE8k4uNXSIZUS/5q3scrixmOI6rQQntfKCah67EYF3HjQuALx2MV1BuvoDE901FHnrIGGSbfB
	qx566KQliTHZXLaIWqWrtJZfKBiS+GvvkFRNOajaAr80YBA5F8QqDI/dwybWO6BFKVnlyBWHqq4
	X0vE7A6qNmiCgzyRdWh5FnR31o/cVQJUOqEA7gelLGgA+kCkmihnrumaBBA/oQFbxGWLUnBuBBf
	on4j/M8FSQO82MSRl7TPz2qzzzZLDrGIYyddt+vF3Uuk4Uy8DwuPJAuZ114nWUpXzqScAom1Q02
	gfBN/fTiNkIcznsPGibFn06+70JHzmQU6etw4+O8DdZsfVZfqM3Mw5PjZqMbYOESLK9XsiZWK58
	TuBn2dKRY7ina7ffLIN6tZ07ZLLfKZOm6thTSzKIdhYmFtNsxTPwnePTMbdn3O0aAtFoIY79a9D
	STw2ury37aqGW+ZPDjLS2/i/6E/SDOb4cgXRwhUSQ==
X-Received: by 2002:a05:6830:3108:b0:7e9:ff97:5e3b with SMTP id 46e09a7af769-7f3de65e719mr26071151a34.15.1787005484560;
        Mon, 17 Aug 2026 15:24:44 -0700 (PDT)
Received: from holowork.tail3176d.ts.net (static-68-235-46-81.cust.tzulo.com. [68.235.46.81])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f41bf31393sm2516813a34.12.2026.08.17.15.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 15:24:43 -0700 (PDT)
From: Fabio Piparo <holofermes@gmail.com>
To: sashiko-reviews@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Barzilai <amit.barzilai22@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Fabio Piparo <holofermes@gmail.com>
Subject: Re: [PATCH] drm/ssd130x: Set the address window in ssd132x_clear_screen()
Date: Mon, 17 Aug 2026 18:24:01 -0400
Message-ID: <20260817222401.906748-1-holofermes@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817154126.D13271F000E9@smtp.kernel.org>
References: <20260817152500.703770-1-holofermes@gmail.com> <20260817154126.D13271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I can confirm that one of Sashiko's findings is correct, and it's not
limited to my use case: with the early return on !plane_state->crtc,
the clear in this path never runs at all.

I also have to retract the testing note. I did more testing, and the
blackout I had attributed to clear_screen during bring-up was
something else entirely, not the clear writing RAM. So "Exercised on
an SPI SSD1322" is wrong. The asymmetry itself is still valid I think
(the sibling ssd130x_clear_screen() sets the window, this one
doesn't), and the patch stands on inspection and compile testing
only. Happy to reword the commit message in a v2 if the cleanup is
still wanted, or drop it.

The other finding, the out-of-bounds read in ssd132x_update_rect(),
looks real too, but it's pre-existing and separate from this patch.

Thanks,
Fabio
