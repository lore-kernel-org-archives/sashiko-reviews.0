Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05035625F0
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 22:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791929716; cv=pass; b=PdTfC0S0WuFqkdEs7PyakJghe+pUG839b16Zlcx6JqlLzJ4Te/iucKeNNbuLpX2E1AfMXeU0EmQkvKX7jRmYxb9ktpLNm1xseR99RtBI7kD0/2ACrDMUdRGSuhqqIaiVkvpe2cZmULrAonMgTKCDlP/HWYb6bDNUJ3vM4yXZiL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791929716; c=relaxed/simple;
	bh=YoOftzpeEReVb6O4VclP/t8iOYPrrpNMFEoppDguHGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ByNeGZxMr3+gaxSjuU9oFErw69f3NdJA62yJjDMpxPhJ38REvY5JbZJ2bl1qEctGMaFywu7Y2jkuBFMFo/y3Dzmz5Xso65l/bjvLQWgSe66G/IBsRm7Y489b3t7KWCe8DPuoU7SO3WpW97d3Qf3B74ttQnoZWNoduLsm9Vepz6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Apk5kxWN; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Apk5kxWN"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-885cf67963eso27774617b3.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 15:15:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791929712; cv=none;
        d=google.com; s=arc-20260327;
        b=GIfeuS7vGypYtwfBKJg+TVgpnFjY0lbr5ECk8SpfkxbvI95RVnstovj1K2CR4IVgGH
         70oKOe0W2Rs/Qd0NbBAMvCrwgU7GD4c95IliMWjcbfXXFEApf/JwxpPQtWhC6SoyRjO8
         J1gA6ygUuBqrnTeykX80m951mWoDPHTwvGgtHW4IC3vpNlTFHdwLJwx0uxlonnxb51mZ
         DuziSfEot6f9y0KkQ1MrqXDUB6Cvnqb9oy3nVJgY/FrPetseEshFtqgwXJbX4egrU4z9
         xaPBqepTvt0QxcqQt4mGI3/vHIo107KcGa3eWHrd0rcu9/55vwB/z+LOv+Ab+hC8V5No
         onEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gu1pMEg3izEfc/rQ67eSbYz040q7y2e9OLH8nvi7wBU=;
        fh=NuuKE6esldo7sF4YAuFYYwAwPAwD6tMqJju31BduIZ4=;
        b=IP0dWBUEXpbGYQN6E9yiSAN2e/Nw0n8iZwYP4FCvf1y0dX11h/fedZmJ5j6B5ZcAzZ
         GFlhUQib+BLHTHxvWDqRag65GpaB6QCay9eTnE0Y5HvDtr08Msqu6KVPtHGbYpNLIATc
         HBvgxg/Fc9kkcp0e2G9zyoXFJGEeB05fGOVv+miaZLR5X5f5UDN94Oj4IkkuxEGkV/Lg
         fjbFrfzeaYmpQKbjIwWfzqi2PhqbJuIBna250dr1YInGXJXZYvfh7bsex3QsOI8qjEhI
         08LnOVzLi9h7c3L8rs2FDNsujyamhD+4rK5lryLpaeHYD/PRKBqFi6W7aOSAgmJcu0RR
         GoDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791929712; x=1792534512; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gu1pMEg3izEfc/rQ67eSbYz040q7y2e9OLH8nvi7wBU=;
        b=Apk5kxWNtE2jHo4UetblcpOT7HfRfa8TxHlsglMDCN+9g+PheG3wKAAEg5llBp3Cxu
         3E0PvOiWYhnrDZ9MYRxfSW0+0rwL/f3MjRIVzXt3BFCSHJbcYb5C4X4rXKKtkhgwQ4Rk
         RBGyBp9tTD6fsNz/LXCPR+CZ73RVOMy0EehEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791929712; x=1792534512;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gu1pMEg3izEfc/rQ67eSbYz040q7y2e9OLH8nvi7wBU=;
        b=mgTuB0xnfdg+QiUSUxW4slIhQqjyuQWsh0G8XXeNAOeyZ1H/H4ylieEOoUMh5gJFDD
         29reDAXigDUDl3sFn8XaadgrTd4saPmGh0Rm1g0zoWKqo1sYvyJ6DPaW0VQyh9rHpVwd
         oKNUsGtiw0+q76hT/Ri2b55RBpTpUZiSdueQ5ooip7hcCD+cIKdIMaJY8szSrz6K2cbj
         Apxzama+4w9WTpoocbNeNt+fhWb5BjOuCkO1DoVj2/4+DxUFV8IHkjcUZ19yonDBTZN0
         ddvEQS5LePe7CeS3xR81lxxhFRZaw3zcht7Ng6fA0vAKqNvICb3XEfS8LmzsZrE6yNxM
         NUvQ==
X-Gm-Message-State: AFq9FYIGbs5Vb6Lfg50tOddmiy2+flhRdhhSmZKo8C7mCpvkueI4uyjY
	2u7G+1nvLHcKXgwof4BzP6DLdlHiM4bf4J3AcWTRcRhjGrHZ/o5sx0P3uu/eKeOziuHUG9jEKU4
	3FkErEntWCyAvyXaTmvdKUDeFZFyGgdv7v60Knc5R0gTjxS5dulEEEg==
X-Gm-Gg: AYBFou0xOHZ0ZFyBjMMFMfOg14fmPiIfxVIAwkrhYRaKc/RwfCUUnJo0JcCAF9fIKqQ
	rVRdmfD21tJypo2S1ib2pClf5JLQ42t+meOwT4g34QDads3Lul1aKgF8UuMFwP++XTxh/YeRRBK
	GlZ0v/k7q26wyDvWLbrMcmidtBYKMhP3jcr9tIFhLjQ9PmCJVpcDHkesPc0v07qXgBFLcJuwJWX
	gWIsOB6eTbHv2MybkpLw/C1wDCSJIZfBXxP9RnFVdiN9WeZaexNs9qBpj3ZF9ofY+5wwYw8oJX1
	VWejLfoyYV/aG3z5D3OqRQXy1NGo41tHl5nXRn5416ZR9ybMXuSflLEyh/MIjCyWNAlWBToFN97
	7uu6LjfACxA==
X-Received: by 2002:a05:690c:e1d9:10b0:8ae:dfee:cd30 with SMTP id
 00721157ae682-8b07ee80677mr35220177b3.56.1791929712213; Tue, 13 Oct 2026
 15:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-7-384af01da3ee@chromium.org> <sashiko-outbox-166152@kernel.org>
In-Reply-To: <sashiko-outbox-166152@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 15:15:00 -0700
X-Gm-Features: AclHuK8LY0flPJXmLlCRmm3TtT6hKXqXYTxefNgnCBXeN5jvcX9L7jCw_bXXSqQ
Message-ID: <CAEe3GZFCEBXTQqGw+JdppYm7hCwuoBTXuAf104ru5nArKwes9A@mail.gmail.com>
Subject: Re: [PATCH v5 07/11] HID: spi-hid: add ACPI support for HID over SPI
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 3:41=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] spi-hid: data race on bus_error_count in spi_hid_error_handler
> --
>
> commit a262e333d16eb58c8aa593f81c7497790c2b01b7
> Author: Angela Czubak <acz@semihalf.com>
>
> HID: spi-hid: add ACPI support for HID over SPI
>
> Detect SPI HID devices described in ACPI.
>
> > diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/s=
pi-hid-core.c
> > index 83678e6835818..f4e9b4e1294ed 100644
> > --- a/drivers/hid/spi-hid/spi-hid-core.c
> > +++ b/drivers/hid/spi-hid/spi-hid-core.c
>
> [ ... ]
>
> > @@ -327,8 +303,21 @@ static void spi_hid_error_handler(struct spi_hid *=
shid)
> >
> >       shid->power_state =3D HIDSPI_ON;
> >
> > -     shid->ops->deassert_reset(shid->ops);
> > +     error =3D shid->ops->deassert_reset(shid->ops);
> > +     if (error) {
> > +             dev_err(dev, "failed to deassert reset: %d\n", error);
> > +             shid->bus_error_count++;
> > +             shid->bus_last_error =3D error;
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> [Severity: Low]
> Does this introduce a data race with other updaters of bus_error_count?
>
> Userspace sending an output report via __spi_hid_send_output_report() che=
cks
> SPI_HID_READY locklessly. If SPI_HID_READY is read as 1 just before
> spi_hid_error_handler() clears it, the output report path proceeds to acq=
uire
> io_lock and invoke spi_hid_output(), which updates bus_error_count on err=
or
> (under io_lock).
>
> Because spi_hid_error_handler() updates bus_error_count here without hold=
ing
> io_lock, both threads can execute shid->bus_error_count++ concurrently, w=
hich
> can lead to lost increments or torn reads via sysfs.

This is harmless in practice: bus_error_count and bus_last_error are
only debug counters shown in sysfs, and losing an increment would
need two failures at the same moment.

>
> > +             /*
> > +              * Without a successful reset the device will not send a =
reset
> > +              * response, so no IRQ would trigger another recovery att=
empt.
> > +              * Retry from here; reset_attempts bounds the number of t=
ries.
> > +              */
> > +             set_bit(SPI_HID_ERROR, &shid->flags);
> > +             schedule_work(&shid->reset_work);
> > +     }
> >
> > +     /* Balance disable_irq() above; a retry disables it again. */
> >       enable_irq(shid->spi->irq);
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-send-ups=
tream-v5-0-384af01da3ee@chromium.org?part=3D7
