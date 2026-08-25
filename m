Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A92A23EAAF
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 02:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787625675; cv=none; b=QxnhT9lV2G5XwNGytef4DPVuIHg/DM9S5ExrnZzU7NG55r52qlSG+m7ORV4IPH6AylSAxorEOXzEoRNuePMY6/I7XjGpZSln0gJJv4Kn2doAoJ1mQLDd+N8Ns/t/co9A3aktfv73Cp0fA4GSkAY8TS0znxkOhOkaJKDFWVk36kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787625675; c=relaxed/simple;
	bh=yWQiJFBQ6Z/CdcZVha4rKQlEjViKMbG4VWIrLOGW3KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FodiMuu3ahxhPvO2XiHiGBEV4XHYiu44qS4Lk5ROL5ifoEeAOeJaS2EMVUZHUDel4dyRi4k9onsdQrcnvEijp2AY5I4kgVaKl1vXmuiaGnX3nYxvuylRWeAElebp6OG+kfax5AQ7csXMweT3p6OaZEYtlHhSCRBSM0k3qeROSrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMdHEmEx; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMdHEmEx"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66c7e3a2332so2842676d50.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 19:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787625673; x=1788230473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWQiJFBQ6Z/CdcZVha4rKQlEjViKMbG4VWIrLOGW3KM=;
        b=jMdHEmExKt5v37D3Vqqj0xs2YKr9MaXCGZtoQh/GDxTQbH0a7vkZZE0UGJGNtKYb+N
         XfEL4+ejdSM+St3dF7FbTU9Uit622Mtj2B31QnBCOzyiX2wnBGsqpfuI4Aj9LqyKPC6G
         F50TB1ZjpJ7ZJf3dw4/miM34stxncIWWDs94wRyTuukbhml5+lDPx4BgNU6VZsPwduPO
         x1P+IbZoK2pAhBUgo4lUOfCqBWDxT3LlSE9gNeQ0yl032eGR1GVDgjkOfa3ugzCdT5rY
         zgyOJ5iT87wiUJqXNRiA0vaM9OaGSaN+avGcbwYyY7oIKSgdwN9mCQZDmPeNhqCEM05D
         OSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787625673; x=1788230473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yWQiJFBQ6Z/CdcZVha4rKQlEjViKMbG4VWIrLOGW3KM=;
        b=rsjwIq5Cf31MsbNDceOTPC0Km5Gut3lJHxD5wwSOzAVvx6tcndnapI3ewBCl+Bc6NO
         c3Knii3F+ILwveaKE1u9cjRsOrkmZagIMPvWFjf8OTwBxVmSL9ved0noybXK0DcfoZDU
         XmxDOQc9l6Hh57BdUS/8WlF2Q1HFntBeJjjxISDr00AshgJgaD+XnmCtW0iVkMl8xp7h
         AMSt/V7lwb3VfHZP9LIfTH1oDXdPgE8c118vnhJtWIyuUxbx0dASXiAYUzapLwmX4tpM
         a/NYzd6T0vQWFy15hTiyiR1fGDwG7UPr9xYaFgmBzUohUETk3PJARUzYDJUkN0ofDH2B
         UEOg==
X-Forwarded-Encrypted: i=1; AHgh+Rq2bAmSY8H9jquNwut+DbBFn9KjeLm7FG6TO1xhfVGBoMcDf6lay7Hk87o2n61FxYusQ0dmpqggY+VQ2TQCZME=@lists.linux.dev
X-Gm-Message-State: AFuF++kcWvAbh+h6P9tEB6qsFL72twJNp8HnhcuB4Jdpphx2zUQhQZGB
	aq5CQGIBhuNqBi+oeQxXTXMWD1sfRRSL2S8CoGJB3lUpInNHvQ5tikIz
X-Gm-Gg: AR+sD12+UxtCXvHcSP/YsypUkutdKR9lk4zqMZgrc1/4JrQ77zBzlzM3Z+0nRI1q+Gm
	1d1sVVC+MJzq/gT24mmpwMP9t2r7+34FV+s26AX7Z7G/CzntQFa5gfTWOWc9os1cZWFC4veSOSB
	PxsRazRz3K/BvXP/Svztfd0tpc0d55GJZCFA9Nxo55KAz0uc8LKyQRPJBxwnOHeWq4kz0yfb1Nu
	1H+iY8yxRGxz6/25YOV+tBYzY2FCZjixjHdvo7VY3aIBjoIlxQz92mafprs5pkOehwNQiq/7Yyk
	7lWMxbmVtmmn4XcSD++0bTh8Ok19OKVjZQlQ3gOiACsx1X5Z7evlpMB8aqwW6RIBu0RUVDnxJJO
	2zorznTauGBPufjDVkVMrKlxn+hOKclgyVr8KQ00f1ABH3PShMBvnPBjfh+t01cO568Pbvy6sr+
	aIhgaRLkOuFHrw6/zt3Bvgd1qQBgwww5rMcZiSnXoTl1JREFV1u0gLe/RJ3FVkootc5QuQy6aMS
	Iux4g==
X-Received: by 2002:a05:690e:c4b:b0:66d:8ed:844c with SMTP id 956f58d0204a3-66d14a21d4cmr1333832d50.11.1787625673178;
        Mon, 24 Aug 2026 19:41:13 -0700 (PDT)
Received: from mac.lan ([136.55.173.105])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66cf4a2c3c2sm4773224d50.17.2026.08.24.19.41.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 24 Aug 2026 19:41:12 -0700 (PDT)
From: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
To: sashiko-bot@kernel.org
Cc: blbllhy@gmail.com,
	linux-can@vger.kernel.org,
	mailhol@kernel.org,
	mkl@pengutronix.de,
	o.rempel@pengutronix.de,
	sashiko-reviews@lists.linux.dev,
	socketcan@hartkopp.net,
	AutonomousCodeSecurity@microsoft.com,
	xmei5@asu.edu
Subject: Re: [PATCH net] can: kvaser_usb: validate command format before parsing in hydra receive path
Date: Mon, 24 Aug 2026 22:41:10 -0400
Message-ID: <20260825024110.12021-1-blbllhy@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824215344.6D5751F000E9@smtp.kernel.org>
References: <20260824215344.6D5751F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Aug 19, 2026 at 03:10:26PM +0000, sashiko-bot@kernel.org wrote:
> This is a pre-existing issue, but do these error paths need to reset
> usb_rx_leftover_len to 0?

Yes. Otherwise the next transfer retries the same malformed leftover and
fails again. I will clear usb_rx_leftover_len before returning and send
v2.

> This isn't a bug introduced by this patch, but does the parser loop
> trust cmd_len without validating that it meets the minimum structural
> size expected by the command handler?

Yes. The generic parser validates framing, but not each command's minimum
structural length. That is a separate command-dispatch validation issue
and is outside the scope of this patch.

Thanks,
Cen
