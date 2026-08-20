Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9F8396562
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 18:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787251399; cv=pass; b=WW10DEuP0k/x1i2t7SHm5wWLeSYQIp/raJcTL411hMgLtUtHzpUd7VeJKr5E2VBZQaCrjDkf+J6YkJ4GC7sTG0Q21/0mwyrEMJrrZcAkEvNXZ/S4hyXX5sov3Jfe7lQrykpkGofSv2ROPJ0mExSvf1HSGh3dgNo3QKDR+lkx5JY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787251399; c=relaxed/simple;
	bh=/gqSU1EwjK2L+OI/UYE3e2zLhINP6ZH5lVx2IhdAMcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEvk8eIA+QcWT8Hv72irxDaF9RL7iGerE05BDj2fWuNGxtMkQexI2jGdcOFyDQSoPOkE4ISgBb4HKlcUHy0oDohn1K3oAtTIo73D34a1H3GV5wU2OyOAFRdK5Deb2v9aEeIHptbMNXLDnNs4H84gK48RZN1EFks5In5lCjE+UWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONMWcTfN; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONMWcTfN"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47fd66a094eso93349f8f.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 11:43:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787251396; cv=none;
        d=google.com; s=arc-20260327;
        b=P+j+G87FEsEXnTng5uprTHtNCaTS9MLZmXRyKf5PcEXWRaB0o8EVt7LnF1t+Q/41Pg
         naoIt4WePQrWgr+bTp6sFdADYK+0A1Y6vfkmhw+0dpnf6KKVO2VCV1sFL+Cw3KvhjDq4
         /cEM/+oY7oFU1isZECa0xjpMrUKe+J1GYkcyskeqV+NcRcEPVE1Q7yb94rDZTN0xHxlz
         oIb+zBrdS5MiRCU3mUYduq6oTsfqU0dontzNEzjOWjE2tV10eczJpaudxhCKbz1YmAod
         y5WNEgy64g78FDNvmACzWbtqqHvqD3ftx2hV6FDzSY2ziq/O4idSkRYfBsqxBBNaG/up
         LksQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/gqSU1EwjK2L+OI/UYE3e2zLhINP6ZH5lVx2IhdAMcI=;
        fh=5+yefQwAkRtpW/d9rCoBGV2NB0OW78nuI1dc4rxxTJ0=;
        b=Miw/vyg1oErH8O1wRyf2/3ghM5Qj1JTk5JrbgCbjE42MHzVLNIBzurTVp8NRIBryRG
         1lg7oPnfXJNzcLVMjPkkGSp7VqU6DhlR6e/g/LSsFwD8onuBzoIUahD1Oeslf918foIc
         1g4N98E5ydIRDfVbNm4VlY1gI+UApBplPsT4CrRP/PHbuTH1sAdfXTfsEdiXxmRIF76V
         nQXjrg9meuxyIbO9zQEr0CnHp1Y4hMW6DnGylaBbZDmVPAtgNbecUUtIbHHn34px/3ro
         jdKPhPcmufGC8jM86kR4G/MlDtgfdUo9VqZcgjM7sLUIUCdb22jX/1SUqtFwxE13zDKc
         701w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787251396; x=1787856196; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/gqSU1EwjK2L+OI/UYE3e2zLhINP6ZH5lVx2IhdAMcI=;
        b=ONMWcTfN0auNrH7IOGA5dX8rh5/XEjxt9fEH8ai/qVQ7Cliiu2C8n3CkD/Yh/UsrzJ
         1Wo2DRTij+LHRovhIKqtHVbUw/NcZ2F1Ls0bbHkGhG7TqgGsG55Hlnr2Yy2CmiKgc00a
         vgNLL+rkHytU8oWOredwPP2U3jlMu1FiQfy4KefoECECPSsmuJGHB6XeDtjLgXhmO4fs
         0yBsWCKkMBaWD8EfBMmVVBqi2AMSdw9Oy7/bhbV7BitWx1BI8LE8AoVnrx34F7hgdJRZ
         xxWVLYNgAG31FhRczJ14Dk8ZvLck5q631OVzqgbiAVDpOz0AJVpllqYfoJOaiMjqVwRF
         ksRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787251396; x=1787856196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gqSU1EwjK2L+OI/UYE3e2zLhINP6ZH5lVx2IhdAMcI=;
        b=ClvmeVCl5JBpX/93QeO/z5FVCbnYXKW8XGfYc39TaViqHmUc6m7oi+DIeBi6ZxDSPN
         Il/qIX2GjU1Z3JFKms43Rzi/QtLZVbA0FAfTEuzmA9delVIdHnRF+P7AB65xBWKn+bUZ
         d0w/WdvSGOO62TRt9ES7SAa1AC3XtEUq2Oi3IIhk7Jg+PMO8PWWMhwOueSjsLYelGEGC
         vpvRZTjRApuPugEVXTxhOhx8/zvlF+IqofpRhv4di2UZQX3omiYdAgwZ/RIa66GRWqyS
         1SqbWxjMnpnM5Vn8oTOlJkxewB2zFGnLb+big/XlNuMbtuts9OiqdVBSz0w0AoWPFdyu
         xqNw==
X-Gm-Message-State: AFuF++mwqKRA8qu6i1TOeOVl1taIjJImgrmZH/OwB9b4cQcvtlXUpZm9
	Bwn/UKTste9GfPEBP8V2Zxt6FVs1Kqutp6N9zsMMdpn8mXDF/nNmQnYa5vywWzcE3gL8SSER/G0
	V47IJt2scfnGDyMfLZJKXeQZ3iroWuUw=
X-Gm-Gg: AR+sD13Uj6CtqD2qD2zLGNIfpl3khQ8TFhC3yn1vQT23K6ixNBDq4MS8JC/QEVzZ5f1
	8IO1Fx6kcwD7hYwEwg2xbWE3Og2oztSzwJS9hkNGN5ukqHfbcdEpO3mqOmEpP6lLE984rnNS6Y3
	97DU2E02RqhO6Cx8dyKIXasuLwwHpDasYlzCmGDIgxdoWbbOPPVpsqdSTZbO6kiyPAufvRWUIBJ
	djgvTz6DBUPvQeirSDINy/Xp5O0xJb4EK6zGcU7SbaKYW7+GEU9k2CH9lKDIHrInPJyljRCM72J
	tU8BrMcTcIbo4lcTmMRWvv15s4bol4prfiIR9iB5uQhClESQughMvDhJGRzZLtcaJBL99tWg8vE
	Ni6cUtT61j80h8HjLTpuWV8RJO7xm/w==
X-Received: by 2002:a5d:64cd:0:b0:482:b886:4ce7 with SMTP id
 ffacd0b85a97d-482c0b95967mr1559704f8f.12.1787251395978; Thu, 20 Aug 2026
 11:43:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819103926.2136712-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819105027.B7A121F000E9@smtp.kernel.org> <aoWqVMc-EQEDqA8h@shikoro>
In-Reply-To: <aoWqVMc-EQEDqA8h@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 19:42:49 +0100
X-Gm-Features: AcwNN1VWAd4yRx74uvdrwkqeGxUaWBMQRHelzjfY8vzM6hoPGzX-UUqIL14Hd8E
Message-ID: <CA+V-a8ug6svy-mWkffaZxN08+TiczPk4mq=aqgavnHdYebaVpQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/15] rtc: rzn1: Replace remove callback with devm_add_action_or_reset()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	conor+dt@kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Aug 19, 2026 at 2:06=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Would it be safer to use pm_runtime_put_sync() here to ensure the devic=
e
> > reaches a suspended state before the teardown continues?
>
> Yes, seems like patches 7 and 8 have to be swapped simply.
>
Ok, I will swap it.

Cheers,
Prabhakar
