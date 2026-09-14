Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72357340281
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 21:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789423189; cv=none; b=D2Mad3GzQQokn95LlXL4kTnadkbVGPawFZgQyvYIrPPZ7isLLW+o2J0nPKitSg5Rmtudee1tSpesbt4+PN2Z7kXuf03Y2RBJewp+AksaCKKSOHFK4cvOD5wsZBphk3EjFpSAVzaYf3OKrHsgvUnkSylDBki7URjFnED0Ht8gpO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789423189; c=relaxed/simple;
	bh=+LzYP2KKgx177AigxhPhM8V1oWR5s8y8QPFx79rLFHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PpCxexHQJJzhtj0s0daKIpEsByRk+bJ0cHJ6hFjDFsl5w9Jtxpj1OsCSRLs/9Jj26o4t4urVRFzdY0CEBLJt1JnA9VRz+8B68A6EWdkKAk5gixZRywkoww8b2f26jmIbHhl30SqJ+MrZ34iCLOJsn4z+Cw6VCrJY6XCuKoBacj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc; spf=pass smtp.mailfrom=vasily.cc; dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b=FpEukLBW; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vasily.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b="FpEukLBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vasily.cc;
	s=protonmail2; t=1789423175; x=1789682375;
	bh=+LzYP2KKgx177AigxhPhM8V1oWR5s8y8QPFx79rLFHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FpEukLBWsbWgfvXnEP6f6ux/H8eRJE+UQYZYgFTCYiotATFR8dg6+rdRpDK2TZAJk
	 DvCh1B4Pk1eZGYvWhvQ2yoszfA7CgDHFLCThxOuRCKJEcVyy1FYMeIvXdtivMECeI+
	 gMMD0GK/lAwI/+mbavUkV7iOGyq4kpBIz0ckAIQk4tiESA18lpxWU03Qw0ATT2hidq
	 7No0Pr4d0mO9Vt4tG7GMqpyGMxgUPE3WiKoDGJeIi1ZwpW2CqfknhF7B4cdzfiEL3h
	 rBQBh75DoRxEbMWeEU/Yvur3WsOz8KYRHAiO/fQvk+nZVZdbBNz0/irSQqRXl1EQhw
	 bPbL5HOzlUKFA==
X-Pm-Submission-Id: 4hkJw60H5lz1DDrw
From: Vas Zayarskiy <contact@vasily.cc>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (aquacomputer_d5next) Add AMPINEL support
Date: Tue, 15 Sep 2026 00:59:17 +0300
Message-ID: <20260914215917.285155-1-contact@vasily.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260914200831.5642E1F000FF@smtp.kernel.org>
References: <20260914195759.171524-1-contact@vasily.cc> <20260914200831.5642E1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Would it be better to add a hid_is_usb(hdev) check before attempting this
> cast?

Thanks for catching this. HID_USB_DEVICE() only matches the advertised bus;
UHID can supply BUS_USB while using a different low-level transport and a
non-USB parent. The cast therefore needs an actual transport check.

I have prepared v2 with hid_is_usb(hdev) checked before to_usb_interface(),
returning -ENODEV for other transports. A probe-prefix userspace harness
reaches the invalid-parent cast with v1 and rejects it before the cast with
v2. The real-USB telemetry and keyboard paths also pass the harness checks.

The revised module builds on 7.2.5; x86_64 and i386 object builds, sparse and
the 995-report parser replay pass. No crashing UHID device was created on
the host during testing.

Thanks,
Vas
