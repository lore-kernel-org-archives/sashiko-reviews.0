Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D333370EC
	for <sashiko-reviews@lists.linux.dev>; Sat,  8 Aug 2026 09:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786182075; cv=pass; b=Q7O/TMYT2IWmmC7gr+lS8XZ5w6ve0j0Y/twu7psEcGTUhjdONWFx0Cr5zkhhxhWBQRHIWQwFMsWn3f+iyftjGxZNDkgOF6SPENkVuWk1DiHocA43RRJAwe/8qeLPHZPHQclrK8YN7zdWV+u/wAcj3kHC37upElDmBf5fhahBJY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786182075; c=relaxed/simple;
	bh=GeR3WgJ0x8i/NRqnVm1DI26+S17KbCmE4428p5EAIek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZtAeGOXMnkYQFAh+eCA9K0ajptpuwBE0I2JvqYFd+Pb/T5P0HBsMArIoqtbZ9rKmXdL2eMmHsbhUdeBdO9QTyaHvtuDW6xBCwz1nDzNsTWxaUL1EYgIzyrtaV8j1XG3W0HeuP2p1dV1OvR2jb6Qk9IT7BgSDXoESN4iDXqfLjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3RUmxTS; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3RUmxTS"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso151781a12.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 08 Aug 2026 02:41:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786182074; cv=none;
        d=google.com; s=arc-20260327;
        b=XUbxYYnRzz5ajH6oM4TuMZ/0bxGC0J08XSVLQ6EEvkkhQtTREUXFLNpEOVDfA/wJ3z
         kicwI1TjiNCj688T/sGp1E8fChUUkuM+gnt0mgndZxg87em8mAIh9Hwoywa8ifpl5W4C
         FkUSSat1yQv8qGYhKtm9t+Vt2G0vThKB0geL7wxeA1CWvjeABYiWRYI0FyIbLDEoYFsM
         6XgxeQLKEkjgjNcvS2bsc2/dBKEeU9cBH80lp0IADHjUlti9c4ogVUdbSYpMkRchD0pt
         2mD4QH6897Jv0b/G03zvh/HBry92wCfHTxNqneq58D5NEeXEPb0zbzcG0rf1WRmGo5+e
         M4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/l19uDd+pZl8D9UObTo4oOMzXM/oQNXxEljarRKbP0E=;
        fh=3mbWQc2KYnV1YBFEjtPx/1jzUpC/uZUzPfAesf3Pc0M=;
        b=drmbFuxY66/s1tkEt5kH+u3qYnaarcsJEOUbqnJo3GY6F80vMzYoNMK9jEnQUQVGGN
         OBNdAuRfchk6xTeS2NziKOK2aFvdHsPR11LzNWS4XPpTupbObknb1eDyPRA6TcewNbm1
         dLodVe4BuiIP5N88agpkYGjPIsAgPhVFgd2mi7i31ghUFv2LpQy2DckdIgrKGv+Fnimo
         Oe9TLP4PFEJzuW1sPrcbaIvAii41PBIYZgvNH7plezlIwGSYAhF2yr00A1EKClM1DyYX
         /PKNu4BnVHUFFCt8w6BvE2XlXW34lRjIYOAd3Zu8qxvP0r6r1CQE1yNXC9wuPosmQ4Cj
         nlRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786182074; x=1786786874; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/l19uDd+pZl8D9UObTo4oOMzXM/oQNXxEljarRKbP0E=;
        b=Z3RUmxTSRb+yilovARZtdDqL92zqyX0DnHgPlK+dmAJojVorMyMULAfv5p9nV1iXfm
         934xRdRffDF2rEXneRGgxKwn98pFqMwlLof0mbc552W+p9BI6rVo07rNJUJnVqbDNhJu
         6MGbRo1SnNwWVUE8sAL/2/BQPTo2AAX8iH6/kut72IQK/jNY4r4S7Tv4YEdkE4ShIqU5
         31WO5ohp0MXW4gf2RzfYJLW7qO94PnbCzxw7kt4pFOb2dBmgOuNPrVqH/GUadiITeGWj
         CMPuyam2XKpl8updHrrhWCihpCEju8GrTgZcyaejuEs4lx/lPItbV7aXc1xoBU8ScTMN
         YTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786182074; x=1786786874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/l19uDd+pZl8D9UObTo4oOMzXM/oQNXxEljarRKbP0E=;
        b=gJTnBxeZ5ZQDPaO7w7mT1oPUkQssr3HSndUbu+Kabb1pXnSKHVQbACKM5r/NR0V0JY
         2LFk3LQ5a7ubOGNo2fLtO5sOv4H75S4Z7fu8WKEY9UfBM9qEA90AyAuUsqkB3rH99sMV
         wEc2zj6MK0CCMMK0FA8XaMWaf8E3pIK/LXxyRMft/iKxkRh6R3i2Z0rn9rwUyRd4m4tw
         O51UO0qEMwB+BBaCK4HLrfn0E7pmalz9yFpO0DhT31QIiWGHwNybeYuxNJIOtEi9l+e9
         BmcpeVB7RTWGlIhHKTR03ukKP+lnuBW6OiT0g/NdT02tS741/ah6MTDLQYIVefYtXpEF
         ZwMA==
X-Gm-Message-State: AOJu0YziQQKxWLAgfR5wqRbhZRnZuctOsgdipSKmzX8ZIXw+YBgk1HWc
	rSklk1WPnAJhsyQGgXTE3UCr1SF6P3P/+FlmlrhzHwwmg9sWuoP8VbNIViYFE8FVdeWI9B3Eu6D
	/6xHOk4Z9+H1IinzjdAVgUSB05ztv7tDRf9nU
X-Gm-Gg: AR+sD10fMv+HTyhASOp//J6Wz0fgwXNSY58IC7JL84saL5XztuIImgTkEpP0uHfLnLu
	8ZZ+KNvnThGo4fmlx7f3Zt81+ljYvy7T21x8EOlNJa2GJcpVRIlJy8LG6N8SLUCCPPseD5Zah8t
	R4P8MnZyNeMBJzQRZD8cPI6/SgSfI0fUQmwrfZBboADEbCWmbHRnHD3O0YwTMYGUC+w3P+eGFB5
	Sc53Pi2VabfLl+D6JFgIg2ydcsCEiVjFcjBb2R+nHtGJh91plCnRi9L/Mbv+WqA4tDjVC8WLHxp
	CoyPtrRLE1xP2GVyxEJa15WxiX/purPgcmfqyek4UIEwvz75OokQTRALJW9WjVFkIVPlGYXnnJG
	Q7k+Uk5CB9egivAe3IhCIg5U9OW5JLP3U8ItsbMNM3Qqs1P7uYWj9TNmS71oFYtaIZT1khtotHg
	SX2zYpFiyLj8feJXc7nENaZiqCEg==
X-Received: by 2002:a05:6a00:2383:b0:842:5b66:3c7f with SMTP id
 d2e1a72fcca58-84f2dedf356mr31868085b3a.0.1786182073748; Sat, 08 Aug 2026
 02:41:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807090945.41690-1-phucduc.bui@gmail.com> <20260807091703.C7C4A1F000E9@smtp.kernel.org>
In-Reply-To: <20260807091703.C7C4A1F000E9@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 8 Aug 2026 16:41:00 +0700
X-Gm-Features: AUfX_mwrkHMk598CXW1q3wK5PB29pkUNeAL39jA2hIuR_LDf8E7ixsTqlrnBNII
Message-ID: <CAABR9nHXD5Ow+_N9DLNyqhduEmosx+sEUmnL1iQvLFFLBgSW5w@mail.gmail.com>
Subject: Re: [PATCH 1/3] serial: qcom-geni: Propagate errors from optional IRQ lookup
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 4:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The error cleanup path in `qcom_geni_serial_probe()` leaks the I=
DA allocated for the UART line index, which is severely exacerbated by the =
newly added IRQ probe deferral path.
> --
>
> --- Patch [1]: [PATCH 1/3] serial: qcom-geni: Propagate errors from optio=
nal IRQ lookup ---
> commit 9ec5f0b3d9989a6071c2d4680336709af497a5bf
> Author: bui duc phuc <phucduc.bui@gmail.com>
>
> serial: qcom-geni: Propagate errors from optional IRQ lookup
>
> This commit updates qcom_geni_serial_probe() to propagate errors, such as
> -EPROBE_DEFER, from platform_get_irq_optional() for the wakeup IRQ.
> Previously, errors other than -ENXIO were ignored and probe continued.
>
> > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial=
/qcom_geni_serial.c
> > index 7ead87b4eb65b..240a6d67d8475 100644
> > --- a/drivers/tty/serial/qcom_geni_serial.c
> > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > @@ -1883,8 +1883,13 @@ static int qcom_geni_serial_probe(struct platfor=
m_device *pdev)
> >       uport->irq =3D irq;
> >       uport->has_sysrq =3D IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
> >
> > -     if (!data->console)
> > +     if (!data->console) {
> >               port->wakeup_irq =3D platform_get_irq_optional(pdev, 1);
> > +             if (port->wakeup_irq < 0 && port->wakeup_irq !=3D -ENXIO)=
 {
> > +                     ret =3D port->wakeup_irq;
> > +                     goto error;
>
> [Severity: High]
> This is a pre-existing issue, but does this goto error path leak the port=
 IDA?
>
> In get_port_from_line(), an IDA is allocated for the UART line index with=
 a
> very restricted range:
>
> drivers/tty/serial/qcom_geni_serial.c:get_port_from_line() {
>     ...
>                 if (line < 0)
>                         line =3D ida_alloc_range(&port_ida, max_alias_num=
 + 1,
>                                                nr_ports - 1, GFP_KERNEL);
>                 else
>                         line =3D ida_alloc_range(&port_ida, line,
>                                                nr_ports - 1, GFP_KERNEL);
>     ...
> }
>
> However, when jumping to the error label in qcom_geni_serial_probe(), the
> cleanup only detaches PM domains and misses calling ida_free():
>
> drivers/tty/serial/qcom_geni_serial.c:qcom_geni_serial_probe() {
>     ...
> error:
>         dev_pm_domain_detach_list(port->pd_list);
>         return ret;
> }
>
> Since this patch adds a check that propagates -EPROBE_DEFER when the opti=
onal
> wakeup IRQ is not yet ready, this error path will be frequently hit durin=
g
> normal boot.
>
> Because the max IDA limit is very small, just a few probe deferrals will
> exhaust the available IDs, causing get_port_from_line() to return -ENXIO =
and
> permanently preventing the UART driver from probing on subsequent attempt=
s.
>
> Should ida_free(&port_ida, uport->line) be called before jumping to the e=
rror
> label, or added to the error label itself, to prevent exhausting the ID s=
pace?
>
> > +             }
> > +     }
> >
> >       if (of_property_read_bool(pdev->dev.of_node, "rx-tx-swap"))
> >               port->rx_tx_swap =3D true;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807090945.41=
690-1-phucduc.bui@gmail.com?part=3D1


I noticed that get_port_from_line() is also called from other
functions, such as qcom_geni_console_setup()
and qcom_geni_serial_console_write().
Since this is a pre-existing issue, I think it would be better to
address it in a separate patch if we decide to fix it.
For the current patch, I would prefer to keep it as is.
