Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622A43451C8
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 00:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788224126; cv=none; b=IGjD2XTuZFr+DQGxhXPIg/3NytFlR1RBP8Jc7bdA/TohIdp3gsgN+3580ZZGpT3E7IpWoP2NlCZfHF1S5q7fa9Xc+vReb461/hSlAgbcIWg3oD2oYZAip/loakPDehRNLAzy/MhLCIQdvE4r8SZwfIyH8G8WYSJ82/jbeCo5jA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788224126; c=relaxed/simple;
	bh=IqYrkw4ZPVFVKybd0wcsvf1eFIs3TB1ctmHqPhb25Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ckMVA5OzKjK54CbNfuj1WNAydtJa4m3WUXEnuqEQu3+SY8YvBiSCCKIB7RR6auBj1AGgGHkIIw+wWM/+SOqZFF2WgO1HkQV4HrSYl/JzjXyIwDt3S2l38oI6s5v6GTEZzFm6AaAhq087t4wDF3o50r5rwP57WAJWcJUZiY83cIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L766QKjT; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L766QKjT"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381b831d535so693122a91.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 17:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788224122; x=1788828922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lM4ssctoMm3dM3zUI1p8Cv/4BMA+1Rtrokinp6Bez+Y=;
        b=L766QKjTkAPmXA15F5FoUdn6wMKzAbIgaZpEL9uwaSyiYVZ6VbGmp9kFlXTAK4wg1i
         kV0F8dX6bh0GQPMOiU++CNUreQIJ2SoPHCQQV6RZWmm6z4k9C2Z+T9RiPiHUy+FL2rE3
         Ae7o+anGf/anys0GgVPOM9PgiqRBDMrUGCesGq6v/UMStS07wwl8ZpxZoKFL8AmwrxKu
         FaYvX9zCAar2KlOM0Idzew6auTxHXDxRCG4xHCiRUuSb/vKmpSmJcgQMh2PXYuSvJSw7
         pP+YeFZ3Fy1hzH0jjPNwdL69ejHdx8mcha5pZRcP7STfMP1rke00NvrrTHoB9Xnh38oK
         rgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788224122; x=1788828922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lM4ssctoMm3dM3zUI1p8Cv/4BMA+1Rtrokinp6Bez+Y=;
        b=H0cFfudOSWEBkSFICrGFHNCaEjR/iEDBP48Gnftecy5Aho/H+lHb5Ot7HpdsQmytwT
         GzzEpUUO7a/X9QMANC2D91SghwVSBcP140z6lL3/fgBhhu6nhQzACMJR5YZkDp/7qcFj
         VmnDx3lJ6C45ZPGDUI8/FQO1CmQ96+wEjbiWl9/3RoRq0/EMzYgEQcyWn3FJB8Cf6XSJ
         XK6K0E93mlhgQobfPonVRjfmcdRCAQEt91+gETkq7UU32iskNJ/pXB5t+XICwHwfsu7w
         PmPBmjVYV70nmiCPxwfW/tVHjMEvOtSKpApVcifixZz5+djTBh6V/EKVK1Yp1Pzx7q2N
         JqPg==
X-Forwarded-Encrypted: i=1; AKwUvBwlHRqd/u2Igssd0ZQMaGBSqvbib3gVqDaIbYNmfr6jnf4AvtqWcYyb9M0z57VqKMnBui+oYwTzuWZYQZi0yE8=@lists.linux.dev
X-Gm-Message-State: AFuF++mlN6T8QpXLp2fht/H3GyL035Umi10EI8+DIYs09KUizaok+bA0
	kQeIhDdW5ekASuw1jucmcEDeZZ3VXTXXNsIWJs3mAphykzyo7t1vwEVH
X-Gm-Gg: AYBFou0HZagl49VgLIryDxfx7l7CmHmwOEGhyZzEih34XGMo/V8f2tzKLnjPPBpzRA6
	ykURwsxndtrnm/QB89mMlhcld74sTJ52eUKpZA5+PUosYKyM6T5t9TiOlZTh8TbAcKCLUvBDvj6
	DosrrDXInIZLednf5mirBO/qGtsYjm+Of2Or4cQAfqBXp4nUj3qcdxOoU46t7KxM4IMof9cze0D
	SVfau1jsN/d/LhLWP/xUfhGa36qkytFxx9SXmmKfaHL0YGhi6d7rYsD98uUZeip83xkEDcRk2N7
	3BRRMb+PKsUNWFUiTPNqKMZHhp+57RUCYOqIx5+gZ2eG+gj2sd/zD7SC09bIbV9W3skHKBZw/gi
	4klt8BqzjcqOY+LCJQgm+9rwvqiz41QCrrz5e7lsMw7pNmqDLs18vSdU6O43S16yoYlEyX4LQyl
	obTS5bObIsdd8eZ31qSYQ7dTwNE9uRMYOAz4Np0TOmeJL7XhiH0rSSOFNU+n9WL841TQkSfsdDw
	oAvYBzj8s8Q99ew
X-Received: by 2002:a17:90b:5447:b0:399:ecd:d68d with SMTP id 98e67ed59e1d1-3990ecdddd7mr3479915a91.22.1788224121502;
        Mon, 31 Aug 2026 17:55:21 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:9c5:2de5:8b4e:3f3c:b637:4ca5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990ba8cbf6sm2351263a91.0.2026.08.31.17.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 17:55:21 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	damon@lists.linux.dev,
	sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] mm/damon/tests/core-kunit: add test for unconditionally skipping the last region
Date: Tue,  1 Sep 2026 08:55:31 +0800
Message-ID: <20260901005531.46620-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901002515.88585-1-sj@kernel.org>
References: <20260901002515.88585-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 17:25:14 -0700 SJ Park <sj@kernel.org> wrote:

> On Mon, 31 Aug 2026 20:28:15 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> 
> > On Mon, 31 Aug 2026 11:50:14 +0000 sashiko-bot@kernel.org wrote:
> [...] 
> > > [Severity: Medium]
> > > Does this patch omit the fix for the core logic?
> > > 
> > > Without an accompanying fix for damos_skip_charged_region() in
> > > mm/damon/core.c, won't this new test unconditionally fail and break CI?
> > > 
> > > Because the underlying bug is not fixed in this patch, the old logic still
> > > triggers and returns true when it processes the last region:
> > > 
> > > mm/damon/core.c:damos_skip_charged_region() {
> > > 	...
> > > 	if (quota->charge_target_from) {
> > > 		if (t != quota->charge_target_from)
> > > 			return true;
> > > 		if (r == damon_last_region(t)) {
> > > 			quota->charge_target_from = NULL;
> > > 			quota->charge_addr_from = 0;
> > > 			return true;
> > > 		}
> > > 	...
> > > }
> > 
> > This test is add for [1].  Therefore, this patch can only be merged
> > after [1] is merged.
> 
> Makes sense.
> 
> > 
> > [1] https://lore.kernel.org/damon/20260830063159.6347-1-aethernet65535@gmail.com
> 
> I wonder if you are open to repost this after the dependent patch is merged
> into mm-new.  It would be definitely inconvenient for you, but that would help
> us getting AI review help.  What do you think?

Okay!  That will not be inconvenient :>

Best regards,
Rui Yan
