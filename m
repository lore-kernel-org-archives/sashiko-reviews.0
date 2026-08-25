Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E86C2DC79A
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 02:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787626216; cv=none; b=ce/dkBpnr8twiDFm8n9M+dEUXYWwE/mqTDXSgC7qv+snUE/FN8qDEaQTcwiJY9awp9b3u6g4/p1OIxoiS0rrdSWVns6M+me3ZVWk/aeIsPQikFY42BpmhzFl//TI/33G3FrPRQ/HuPWcHUtNFdTQaZ+gBiaXLMr0WjawNpy175E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787626216; c=relaxed/simple;
	bh=VZGv3nP8pjnZdO2V6lGttvQqZy/jkYuM5+4UwJWTg/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2gS2nISuDKCsNuWUsFAI7rM3BJ90ktud3Y748KqmJfEvFaJ4xpDwMAMl0ztxxt/MF7C/VAbGAPU+D4uTVdoODF6gAn2xbbbAGoJUpIEWMwtHjrcdbInVCDYnYmz/jOniHwvsCDRWfSQmaK+D55qK4aoq0cZcV12geL3surOyUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwICWvBe; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwICWvBe"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81f3b227a4aso66678797b3.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 19:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787626214; x=1788231014; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZGv3nP8pjnZdO2V6lGttvQqZy/jkYuM5+4UwJWTg/A=;
        b=QwICWvBe5hxxE3ZmXu5mkTZnyr6RHoIr7FglOpRzPHN12wbZZIGAikp88rgOeLL3uH
         Twdc2u4X8ho9RpWC2OPMXeaYifbPgxoKAKPOsiwZwmI/nkDh+YWEzcIDT8+suf6CTKgg
         zh+2QFCdZGOfpaloxzejnTBoHVMg+O9UnqXJLNWrLIZ2mXY0FJpmsMA43JtfA1NDuWAy
         2SoxvFA6gM18tVoqs8d8ElNC8wh8IfeTyyuKdRp0pspviPVJXYKbxTJas9kGq4/QF7j8
         /S1pCSEiizNteDMFIEhV4VVhhuEBHHPG92d1+mmPxiyxJl7pcIyqk1tI4maWCK7EbLKc
         pK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787626214; x=1788231014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VZGv3nP8pjnZdO2V6lGttvQqZy/jkYuM5+4UwJWTg/A=;
        b=dMghPGNFi79AYoQfMWt+swtBoZX9zVdgG4OCDbPaydCML4gFe805dY5bA+3Q/0B5pw
         vJanyUU0kDjg0eOhFU4TXxR1rcrCXHL2CxNtpk+cuYGWxuRPOXTgipYwdvWUG9c0GkXc
         fR+Sv70hZspHWSf5u6DWmlJWm2JQlzxfDNNhxBHna6Q9nAMtRoieDdSu8T0wmNmIgZVX
         eTgfUdgoZqQUl+P0i3yItbzudGv3W6WgI+K3vSg1lQzob+9N2sBctRzY7B96x5hcLisi
         o8U9gitnWC8oUR5UfrYtrICRtKPNuXIjVrUv+T9RGTVTiryULH51tP6tkyCenKWUGEs0
         4W2w==
X-Forwarded-Encrypted: i=1; AHgh+Rq2t2wGMAVcr+IiR+0XmaR/yzvEZn4oC9G29qS4S56zrSFzS8SxNPjI4Qyd4F0u5Cwbhnxq2SBAkN6HJ05Z5V8=@lists.linux.dev
X-Gm-Message-State: AFuF++k1j10MlPbwv7EQVGElEwKYCKUvLsuTX5L+IElafAtqm3jx7Xyz
	fgWVVc2HvOa+y47ezPRN9SIPHUfGZ8XZOCkuvs2xKPJgLfKDDjULwkpy
X-Gm-Gg: AR+sD10wnIcSemcD8gD1qX8sRyuyZUKDoMDZOUb6V/pidboHytl6eLC+9wdsXzGwQFV
	MeHUZwtoUZeGgg6tMkgmhZXPj8rzM8KY6a94gCu900cWPFczM8yHtumCb/BIpFtpqszlYozPdxS
	zocZ/xmo5ss2abGA8mqUN58Lk67eoK2UarM6axlMlw51gmCliV+mvcuxMk80P0Onjuho5Cq4XfA
	kuKhMo5PsTOiigBjJyggmdE0w55ODgl+7YdAqR+Cm4Yls40t4PgSp0eqZESnlv5V94TtoRV+KBj
	KN5wmMEssioM7VfEsCFvwZuGsOGZRcXDvyJYlqrNRKdNZvxra86hwtEuDhv38ll0c36pUWb1Bxf
	BPEvQO2LUibbMSR98+KInj+F6VrGnQDQcw8eLpS68XMYZmmFBL9sis5T67ENmSRbIgos7t+f9zt
	IGn5u4shLCn9i6Smda/I/NKQwuFIX/4Nh2Qb7ogp4mtElSlQDY47Y2CmVnFBBt6E/srtU=
X-Received: by 2002:a05:690c:c6d3:b0:854:5db3:4ed0 with SMTP id 00721157ae682-854783a0e38mr15676447b3.31.1787626214359;
        Mon, 24 Aug 2026 19:50:14 -0700 (PDT)
Received: from mac.lan ([136.55.173.105])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84cabe2570fsm42799507b3.38.2026.08.24.19.50.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 24 Aug 2026 19:50:13 -0700 (PDT)
From: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
To: blbllhy@gmail.com
Cc: AutonomousCodeSecurity@microsoft.com,
	linux-can@vger.kernel.org,
	mailhol@kernel.org,
	mkl@pengutronix.de,
	o.rempel@pengutronix.de,
	sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev,
	socketcan@hartkopp.net,
	xmei5@asu.edu
Subject: Re: [PATCH net v2] can: kvaser_usb: validate command format before parsing in hydra receive path
Date: Mon, 24 Aug 2026 22:50:11 -0400
Message-ID: <20260825025011.13898-1-blbllhy@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825024110.12021-1-blbllhy@gmail.com>
References: <20260825024110.12021-1-blbllhy@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please disregard my previous reply; I accidentally sent the response to
the v1 review.

On Mon, Aug 24, 2026 at 09:53:43PM +0000, sashiko-bot@kernel.org wrote:
> Should there be an additional check to enforce that the returned
> cmd_len is large enough to contain the extended struct payload?

Yes, but this is a pre-existing command-specific structural validation
issue. Auditing each extended handler's minimum length is outside the scope
of this patch.

> Does this change break USB stream reassembly for valid fragmented
> commands?

Yes. An incomplete size field must be buffered rather than treated as a
format error. I will preserve incomplete fragments, complete an extended
size field before reading it, and send v3.

Thanks,
Cen
