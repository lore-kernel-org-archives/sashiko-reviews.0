Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB5E349CFF
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 01:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791853511; cv=none; b=A/hlim5AG4Hot70HvGrNZNcmWZ/xyoQFuXL4xYnDNwezPwuPPe5tepXyTDGD0YQnnJYOoIFE54q7ABSNiNvx8VXErpL7np+maYmQ5xIvdZbTOXTnuZMoTArmoOWYI7mMIwp6TEVw/2UNXE1II5qf1FrIaEBmiSbMLqoEZbxk1Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791853511; c=relaxed/simple;
	bh=lc9zj8acVJzB2Zqg5NYLr7ldjKhGUblQwyVTN5qJy9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FeoAqISjayPdzG+GvGADEkhbB9ljh+i2UzsgbmfKQekcHQSLz/rnJ5SLxXqb/EJJDJ6PHp+u2H5aZJZ3tzisGVXLpgsilaTNr8dwiqF5+YJb/YcOyCcdyKU4YJRKGDJD520knqJs+Q7+ooU6BwMgGID3z4WjWNR8ubAmxboOKfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=NTNlOH2J; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="NTNlOH2J"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-892734ce7e6so809674b3a.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 18:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791853509; x=1792458309; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rogv8gP1H52CoBczHw69sKFPcqTXLhNajNS7Lu6i04U=;
        b=NTNlOH2JJAM7nGy+WFH0K7Tr2pxj8l5rFDqRPXYgLBF2CeisTMxLmLmeJqkhsQwmfY
         6G07qfG41wK+0ciB3QfVHdJfbIn0/X6smqhFUbHfsXLCIEprcJZikal2x7FpeHXWGfZK
         5OdNYs9B0+HAS0+KlSRkMpI2Gd396VyL+lKYcGiOOhxEohJfxePPbkVTgoifbmj4S17P
         rgKRzsw4GjrLKPRDtP9BO/P4cz1gNXuvOSmT8eeNpFYZz8Gcy98R5Bq8lFfZxw+Rf3FP
         fVzDl+hy71glN4F8KBbgLZ2GYKePPNNIYP3Y6cdWXTwNr26eh4cAhZY2juNG0PL//YZL
         8sqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791853509; x=1792458309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rogv8gP1H52CoBczHw69sKFPcqTXLhNajNS7Lu6i04U=;
        b=EuN4ATobBehgUq7O+kEs9kGtlGECPFVCKG0Hn/gPO97mJz4yNxvLeB614zDhFjbEH3
         r536dZHtrh9MvI6/D8p0iX9lP1+nbj5XCzX2cKDGnh8LXctcV9EDZHxgU5foEVqyqHEj
         h1r1gyJ817z06D8fR+V2tsEBMhffMNJVlWGtvIW6ZnpYJur66nOaribdfLgKvNmrox2M
         WdM26aYhcgBLcL4Szbzb/ZAcSMHeto96P2X6SHpow6Z/LviErCX8UvP4jVINooAor6hE
         T6U68Jz0UT01KuZRTB35Pgio8ttevQXD9SmHjQZ3kdBZ5gU7n50YQLu4NprKncSFVKuJ
         fkCw==
X-Forwarded-Encrypted: i=1; AKwUvByoAMSDq3DIsVEfbSMwlK/+VR9268KXuiHmrZkpgX6ZmoUSG5FMMobLlNvpyf3bKkzpWcdlKS12PPdjEsACaTk=@lists.linux.dev
X-Gm-Message-State: AFq9FYLfunWIaiwFxU5X3bZUG9QkyD1FLdo05kCjB4bzDdXTZuVjjvSe
	8eYpzDAhRZWOYwFFyTshOEjxH/44uY2DdqSsBFQSdUKkb3j6KcyWD7VM65N2lTuxR2M=
X-Gm-Gg: AYBFou0o7xzRruqZfjDCUKQwG+OM+D8GgiyMqk0tvmmz77RJKisCjq+hL+2AY+7aFWQ
	6DML+Ih/vhEcjG6HvVh85I+akvQtN5gD271wKipbrNa/nAZ6b8iL3A9Sl6D/mprifk7We/jE51W
	hic6nSN85IqGF3Zu8QdjhAwtcGrpL3PpmXh9Ujv0QlbKRLkb5vEKKmqZJRR7lxM1m4ae75xBdbR
	L4VIy95a7H2uwpeZPlDJYfET96TeO148zPqsDVWtSVAY1IhTn0Qh5hNEzccg9LaduWWOUWu0gQe
	SDtQLbpVmL1JQg3S+e9EUaRHx4kU3jQhXVcjb5SgLL4LElPA1WiHonUxXFxHywh3rxvh/Bfs4ly
	GggfCjCEUJxDJl2O0b1czCb1zaGjERcftV/c0VDryQcbjunqo6xL7oT/B8p19RbDR10MYogQY/X
	GKIvA5LG8z+h3Wc2wgczSbZS0+2XwPkPMYN7HJXKdVv3YBpRDaReUyk7BBRZ7bxgY4+n16SD+vY
	xvVJQ==
X-Received: by 2002:a05:6a00:4185:b0:890:a3ed:8a49 with SMTP id d2e1a72fcca58-897c7cd481emr9345777b3a.51.1791853509580;
        Mon, 12 Oct 2026 18:05:09 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3107194sm4387216b3a.18.2026.10.12.18.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 18:05:09 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	target-devel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Tue, 13 Oct 2026 10:04:54 +0900
Message-ID: <20261013010454.2472267-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-168374@kernel.org>
References: <20261012154422.2436134-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-168374@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks - both are addressed in v2.

Deadlock: you are right, the failure path reached bot_send_bad_status() with
cmd->data_len still at the full declared length, so it queued an OUT drain for
data the host had already stopped sending.  v2 clears cmd->data_len on this
path - the OUT data phase is over, so the status phase sends the CSW instead
of draining.  I confirmed the drain is no longer queued: ep_out stays idle and
only the CSW goes out on ep_in.

Log: v2 uses dev_err_ratelimited() for that message.

For what it is worth, the same bot_send_bad_status() drain is reachable
without this patch by any BOT WRITE that completes its data phase and then
fails in the backend; the failure branch lacks the moved_data guard the
good-status branch has.  That is a separate pre-existing issue, left alone
here.

v2: https://lore.kernel.org/linux-usb/20261013005854.2470384-1-yhlee@isslab.korea.ac.kr/

Thanks,
Yehyeong
