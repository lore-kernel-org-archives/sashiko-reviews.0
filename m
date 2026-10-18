Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519C03DAAB3
	for <sashiko-reviews@lists.linux.dev>; Sun, 18 Oct 2026 23:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792366293; cv=pass; b=sqlupPG7N9m5e2XZfNzqkK+e2PO4bhYNsfx5NCQi3pSjl1yI3yylrJzxiczBLtp+eH51Q0U0g7xn1Vwq2HE3Zob0MdeAo3LD5FTH7PNvXqNmzdz1yebbiNQnqt+5qGaQxcH6L+RIWEXY7XRM2eT7cZRO58jzoxDlyzwakr74gAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792366293; c=relaxed/simple;
	bh=Xg38Z07jNwHN1F4uO1K2Lyf/YBRj7zFPK1BqVTeQ5ks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=agGFa3qtbfyDTGpqQUwyAkvmHpuQjq5fFM5UbsIro32ovloUJ6PTGRZW9UZtXyG3o364UQXYzaMve74r5Q7owwqGvk8j57NtWKbEIfP8ntOJyY88Py5DQ1UdfPg5kFzppA0DE5upc7x5SBuc3cL1yuPKJwv1/bk4I2MXNZQWpKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=np+gsmu9; arc=pass smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="np+gsmu9"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7cc013095d4so452228137.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 18 Oct 2026 16:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792366291; cv=none;
        d=google.com; s=arc-20260327;
        b=m6zNZiwPQmhTtnXp6l/6OD4sbJXU3kJu1PbHLl4iZkz5I0kjKzAGH68/D8qicUS3H3
         ol2EiHI1n1EeEEDtsBf0X3iU2bkI8NgH972LjXBNACp0EW7RpCXu/iLtGKkX8wWbVg6i
         dnS14qMaYlHIRsZ23n/ZHPvvvFs9L4UiYWaxzxmsa9rMqFiVuunIuMXVbjQg3F7sP5ZD
         gIUdrPnIS1an3gF1mdFrpQq3s288JrY4IH+Sz24vc2T+o3FTPFZRHeeiQKtrwYnn9k6K
         fDhFQjaJapXOAzRTAtH7WilHVW8HecCQ9XZph1cBEtSe0atn4VLBpqFTpKVSENmZyjwq
         G1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Xg38Z07jNwHN1F4uO1K2Lyf/YBRj7zFPK1BqVTeQ5ks=;
        fh=dfvPRi+t5KvUF1qpgNVmacxvd83mvku6fE8K+/2kbH8=;
        b=Wd1UUp97FDsjeTptcXKub0ert68eAdo8ebzKhzFm/x/Gc6LVqGSq518ve8F6QR5225
         +6M5xefrAKUqpzYzZ+S2EFfCbOQBipgT4GGqyvM1sdbtrF/KLgT2Idp+AAG6tyNEBikC
         /HDr+fRxcM7wKWkniab2WVIXlbqUpHxraISUGRPD+XB0IVDOtZVaSmWDwr5N7gR7aCLe
         XE/E3/vCpT7mZ+sSC333A54/UnDAVLj7pTffq6slK0eOusBqtujt25w1U2OCLUTLrlKX
         DYuoC02JweeunTxsraTzjaFtS0SfdKUv/H8atMU/njkFdf/szxcysTvxdhi3jrtBrS1U
         gR1w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792366291; x=1792971091; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xg38Z07jNwHN1F4uO1K2Lyf/YBRj7zFPK1BqVTeQ5ks=;
        b=np+gsmu9m7oVLpFPrkTztCTBtQcJ7CIHLzAjVMus3mmgdaIg6QcHj2PYg0E13vIAQL
         gC8C5Rw4/9XpxFUV4YTpH+BhLeIXesCOnwgnf3n+l+aL9hCSXbgf3m8O+VuEcy+qBd4f
         1jkdi0nHEkRma8nH28kS0NaU235kosYHmkDEXKsahemQy63Qw1l38Dv5yiVMSJiBtWUG
         fJMqemELIvnurO5camDEloyOgJFyEfoxTiJQ5YzZBtbRNfxxBrXbq4DZoA1DT589RmAN
         1aLcvP29hP5JoBpPZ3R6XCNxMVTtUIIW4xA7ppMpV1b8iiTJe9WWvnDAo1aocxIqlvgj
         D7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792366291; x=1792971091;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Xg38Z07jNwHN1F4uO1K2Lyf/YBRj7zFPK1BqVTeQ5ks=;
        b=EDJs1CXy3eARfv1x4O5ep3G7DNe9NL503UWvsdXIJUBsSI4O8ZIOeH3JQtc3QwpD0f
         U1WZi/mWmr6r/62SLR392mZuSlB259g+brGrRaQUPmjrvk255ovJZU6l42qRFWDJegqD
         5kuwP394d/qx/rz1swZZhwxqAzhbesAIAMn9X748XPD7vR9rdmglYjpiAZGzOzaqkgXv
         hQl2/We5Ips3+iQvOXpNLtprq+4h5bH66docwgbbje0KpUqo9pVseXB5Hn6h8kCicSRH
         +dS8mmmJYkCse5XDhwTetgLiyRbRE5j3BfPHnqrVSFcXFNbika41YNPmVM63x4baXsEA
         MHsQ==
X-Gm-Message-State: AFq9FYI0booJZCNGGclKOLsDfDd/qU9hE8V80p8Qmh/sC74o81r142Ki
	fJfgcWyS+ljFWtK07dOZlH83WQEWWIo2F5T6QZCqqxX73uOcWDX/2kKi/Iwlk1OlMh2WCAE6re7
	lPpsitovtE0TgqoUA8Ekfv27gV6T/Bt4WN2WzJXM=
X-Gm-Gg: AYBFou2g4XG16+j1Mx0SQ6tK3/RikbEuoN3j+ciUGoZR2Cb+Uw2cG0c7O9QQovJ3dtK
	D9+RL0sOrYEJC8XRqNl2Afd7cbvRF2WDp3NJ4QIgb0jhUvxE3wic01g8VPfJCxO0YaWEmzwysgx
	Eck5QK1AURWRp0c7Fd3uLqYz0crbujDdGYVMJpqiIXsqQ48IWcVTrjDEjysApRPsgLd+EWvpj9t
	1lPgq4ULUB9pGPmG9f9cGhXuPBw/YShkFU5UmWdL7MiEzqW/gnBrjtHeZcd59niZzjE4cp/hFjd
	1cI5OH00clc7Qk99BvtTy+RSoNZ+js3Y3XfgXKW1tysd6tiVqjjXcdHt9w==
X-Received: by 2002:a05:6102:3c92:b0:779:5049:87b2 with SMTP id
 ada2fe7eead31-7cc36494a62mr1577333137.0.1792366291163; Sun, 18 Oct 2026
 16:31:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261018224627.60328-1-markpariente@gmail.com> <sashiko-outbox-176440@kernel.org>
In-Reply-To: <sashiko-outbox-176440@kernel.org>
From: "Mark R. Pariente" <markpariente@gmail.com>
Date: Sun, 18 Oct 2026 16:31:19 -0700
X-Gm-Features: AclHuK9fAUVSx0HILj3AwYV2CMv6TDhde-IMbLTUz1PFT4ZZ37tovEoqYzIwRVo
Message-ID: <CAEFveFzbaDrjALGQ4kABdpGe3+JmYjGBHpNhP9HCUZd+vsspRA@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-dj: Re-announce connected devices on reset-resume
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"

> Can calling logi_dj_recv_query_hidpp_devices() unconditionally here break
> Unifying (recvr_type_dj) device enumeration when a slot in
> djrcv_dev->paired_dj_devices[] is still NULL during logi_dj_reset_resume()?

Yes, thanks. For a slot without a known device, logi_dj_hidpp_event()
passes the HID++ 0x41 notification to logi_hidpp_recv_queue_notif(),
which adds the device with reports guessed from the device type, and
the correct DJ pairing notification is then ignored.

This predates this patch: since commit 74808f9115ce ("HID: logitech-dj:
add support for non unifying receivers") the same happens on Unifying
receivers whenever a 0x41 arrives for an unknown slot, e.g. when Solaar
sends the same fake-arrival request on startup or when a device
reconnects. v2 adds a separate patch so that on Unifying receivers such
notifications queue the unknown-device work instead, which enumerates
the devices through DJ notifications, and makes this patch depend on it:

https://lore.kernel.org/linux-input/20261018232654.70571-1-markpariente@gmail.com/T/#u
