Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793625135;
	b=QqyifzionV25M71wD5HYA2tyPzti4BAxx060kQpV9H4Z/00t0S+9t2VzLK0VKZIHLphW
	 IrvEvB1WCZwrzuzGwGJW6+FP3DlAmoQDc5a2cT3NkWiW8hMWtwh7Y2GmKA57XNUQdMNc4
	 VbITyAWUk1TsqCrPbqxbwtIn97g52R2F0wk0z3aTJWvLxLIDKB/+K1IafuAacsakueFda
	 RSBR9yrttPK6nY7BpNDkP2nIHjPlt4X4r7LFN71b0/YdvQ7f96IdA/Tm3naVzZMpDJyP6
	 PhcCInlw0XooYgIUNHsAIGCeLOD16s2XAF0+PgyR1brzl0DboYrgFt5h28vWUfP9f9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=8uTFR1xxFFaOIPhvz5LXO6GWBsqM7yzNUjcEoLyeYHk=;
	b=ib1QMUCUeR/KwFBucipOWzLakJWzD0INXPQZTjA8DW5DHHeF/uytgrfwYH4KJ7K3+uVb
	 dN+KLkVpqxxX1E6w6lCv8fA3hsr3IrPCzMRaxuAa6vlAhJSrLRmWD5jiVt4ppp75dJ6de
	 e84GwqUnJj/OHTuKQ2fEZPu1pSKqRD/PNRFp0Qc/E8fe6s7iK2znEytVDRSUI4G/pSLGA
	 KlBX/cspARne7bCNDmoCeVSNTVUercVNuXqrlnuAL2YgmkaTnAEsg/fQIAKmgqb8VClW6
	 gv2mshCycyyPhepgh1kdweUdZv98YchxHenEdHQnY5vLuqqRb8SX8P8xmeXG0bFHaYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=1SLMFRfr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7577D606A327
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 13:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7577D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=1SLMFRfr
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b4b7dee316so2870085a12.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 05:12:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793625134; cv=none;
        d=google.com; s=arc-20260327;
        b=D/OMNVfPwwPIySn+Y3rxdTMKNGfBy0HFKMJhzFZ5l/c54/6lQF0NyD8szyLEQq1mJS
         k0S/eUyLUH2yFUroakd5EEXkQJ3Z1qIC4XK4DlHegaxtw0r6e1EGiTCU5DmEMZ+l8G5v
         IOQbb/fiKEN3wNFngzkrEPQHqVBLFyqxT5jesrBCV6jsMtYRaiKuNZV/vceqFSmVJ8SD
         VM6doKxGPp+uH/FzgvnFZqhF1bP/5SqJNyqdZstNje9yKuuavVhnKa8brtZ4UCEl8cSg
         bSKAuQtBPVy/7qCSUI3OJWvjSGavQ+EZ7e0nBaXjkgOsqaIyfp6Bokw9wym7HKb9aThS
         FxOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8uTFR1xxFFaOIPhvz5LXO6GWBsqM7yzNUjcEoLyeYHk=;
        fh=VuLhXw3JncJXxR3qDc950o0y1R82tCexOoAH58o69Vg=;
        b=X6mWubZLVOjir0vXsptY/AoNOGOi4Jc8mPhMKSMPfCeTGQFXjN8HxLn+NVytDohvh9
         5Q/jhKKYLScF3Q+2nFI6tVFItck4nBsFRzZadx1sbEIc4A7IUD9LFWRfJvxw9XrVyfxV
         8iTl2V+uW4jV+1gSXMnOuDg8G/hXRqUNgXXGgc7iWjOLJb+7HFRAByDlcEzjE5eIOUIj
         hN4Qu9xbFe2UNdQY85XRA6eBQk3dh8iz5OBlmuFYWR2mkWVar7F+P6yLgJHK0G93Y1Kg
         9b6KmQLd52iV6S9CahCQjKfhZBKLCTwYpfCt7v6PYKNNvaxNTdrOh14CQoPEvzZWrmdD
         9Q6w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793625134; x=1794229934; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8uTFR1xxFFaOIPhvz5LXO6GWBsqM7yzNUjcEoLyeYHk=;
        b=1SLMFRfrPIHG3k/p7PnaPn4Knx5grEtF6YWizsZBv7RQYBG1rsLzYoaDOCUzpqjTe7
         zcRtFkhzm2l7iTiX4TBtwNDh7O/XaFGShR+SEUB+EAmTkATX95Jc00hZgYicJ2N/y0Ob
         CJ6ZkNWfyit60BDcwh24PXWCNvoRR06cOB9IPDdHH2yyHqnYOJpps6TvlWY4oWOCqlGh
         dnujdHQEdKn8YOzfAn99+v3SrT/eX4v1ch56M5h/17NGFmQuRuKLVo4tfTxo2xTPo7fg
         XYpcTB0fKCtGs8hlU8GumHjY8IBvmWFN4ydoKt3KEQVdC/th7eX7vMzgzBV1WEeVleh4
         Hn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625134; x=1794229934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8uTFR1xxFFaOIPhvz5LXO6GWBsqM7yzNUjcEoLyeYHk=;
        b=LGTxPVrlFSuo2X5/aMJAbDTin+SafJ0o3v1nw25V0vMKTyJtYedVqBgvNk+D8rka9b
         PcNgcU5GVDPEL+IQ4mpVcx1NPPalFpVQfr9cL1trAjJIyvn0A+5FypelvvUw5okhmWDg
         NNkdLO/0G1oCRMyiUwV1eO3Ji20iR71C1x/JdeOBocetGZuFR0N8D01VhFxbgNeyT1pq
         TPxRTLX87B7zMfywdGr9fnO4RuhvG4nu0lBDaVAFJSJzS26zeY5qjspXJx6o7obzXlBw
         kYIZka5CLg/8rUK/yYDT/PDXLz71+THDDE2/bsJlCV4B1yl2labxctQfY2o4jQL9H0tJ
         gwZw==
X-Gm-Message-State: APuU4Z/m5Eq2k1Z/VMFepfOyb9w9CElD25skTn0iSuZnE+RoJfVmq5Ow
	mMApUme3cgg4pEn3/6yL31/7+vsTcx6+FWk+uicJr5ajaK/klXV8Kyetus/5b7RcI5rjwMBPIYN
	1N8xLa//+RCBuRAiA4AvAx2EioAnijHonAuO6ILHf+CTHj3YPCiXSeeJcXPmj
X-Gm-Gg: AYBFou0AJwSe4y6zOOJll7Q2NwNvZ3WZ9hVi1Nem6dk12h7w8HZnraehXj+/4h5Tadl
	bkDF/x31RnPnHao9qF5pXNa74KfdD+T8V1XF7TniRknBVWX0m1w5PcZCeBvNI7w/LuNEFpNniXd
	RhL1JjI4GWa8nsYraujN7dEty42Cp1oln45ZwBjtsWMQLVL5QHCeFuuGI4M/o35GCsKBXTZ1moB
	WUAXSm80lxiZ/8qbb0b+5Qio4NObpmktKpj461+9cLc0mxQmdbKWkzpJyPqCsxnXU9Z64kXDbPu
	baZLlKOhaRgJaw6oZWNRXbEz7nX7LCo6pDvqAoz+dMU1iFtTvFiCTWZdS+9+zy2RSYuId+hE2kr
	YdK/7s/bNMaeytS90c4x3lbVAqxv2F/n3SSd0AAwZxcqc/6N4n1rvBWQ9EkXegYuL1d4HVg==
X-Received: by 2002:a17:907:7f90:b0:c29:f5d5:5a9c with SMTP id
 a640c23a62f3a-c4ca7b5f596mr875339166b.38.1793625133753; Mon, 02 Nov 2026
 05:12:13 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102-fusb302-drain-rxfifo-v1-1-bd9b232ab345@flipper.net> <sashiko-outbox-193448@kernel.org>
In-Reply-To: <sashiko-outbox-193448@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 2 Nov 2026 17:11:57 +0400
X-Gm-Features: AclHuK-n43QHaHcrbhfL_HnD3KJAXwokmTYqhfKuY4KazsGHX7cmxbgGZawV8B4
Message-ID: <CAKTNdwGSxPyuadpQPY5oDRHwC_HTX7BujSCM-bRiKgjnyicDvQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: fusb302: Drain the RX FIFO on each PD interrupt
To: sashiko-reviews@lists.linux.dev, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 4:54=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] usb: typec: fusb302: unacknowledged messages passed to tcpm_pd_r=
eceive()
> --
>
> commit c6b027a56fce877cc0a50df66b78e46a0dbd88cb
> Author: Alexey Charkov <alchark@flipper.net>
>
> usb: typec: fusb302: Drain the RX FIFO on each PD interrupt
>
> This commit adds fusb302_pd_read_messages() to drain all messages from th=
e
> 80-byte RX FIFO on each TX_SUCCESS or GCRCSENT interrupt until
> FUSB_REG_STATUS1_RX_EMPTY is set. This prevents the driver from falling o=
ne
> message behind when the hardware queues unacknowledged messages without
> raising an interrupt or when multiple messages arrive in quick succession=
.
>
> > diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/=
fusb302.c
> > index 3319f6a2b0c9b..6841db172e117 100644
> > --- a/drivers/usb/typec/tcpm/fusb302.c
> > +++ b/drivers/usb/typec/tcpm/fusb302.c
> > @@ -1481,6 +1481,36 @@ static int fusb302_pd_read_message(struct fusb30=
2_chip *chip,
> >       return ret;
> >  }
> >
> > +/* The 80-byte RX FIFO holds at most 11 messages without data objects =
*/
> > +#define FUSB302_RX_FIFO_MAX_MSGS     11
> > +
> > +static int fusb302_pd_read_messages(struct fusb302_chip *chip)
> > +{
> > +     struct pd_message pd_msg;
> > +     u8 status1;
> > +     int ret;
> > +     int i;
> > +
> > +     /*
> > +      * Drain the whole RX FIFO rather than one message per interrupt:
> > +      * messages the chip does not acknowledge raise no interrupt, and
> > +      * reading one message per event would then leave every later rea=
d
> > +      * returning the message queued before the one that raised it.
> > +      */
> > +     for (i =3D 0; i < FUSB302_RX_FIFO_MAX_MSGS; i++) {
> > +             ret =3D fusb302_i2c_read(chip, FUSB_REG_STATUS1, &status1=
);
> > +             if (ret < 0)
> > +                     return ret;
> > +             if (status1 & FUSB_REG_STATUS1_RX_EMPTY)
> > +                     return 0;
> > +             ret =3D fusb302_pd_read_message(chip, &pd_msg);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> > +}
>
> [Severity: High]
> When a PD 3.0 partner sends PD_CTRL_GET_SOURCE_CAP_EXT (type 17, 0x11, wi=
th
> len =3D=3D 0), the FUSB302 hardware decodes only the low four bits of the=
 message
> type (0x11 & 0xf =3D=3D PD_CTRL_GOOD_CRC) and places the message and its =
retries
> into the RX FIFO without sending a GoodCRC on the CC line or raising an
> interrupt.
>
> After those retries time out, the partner sends PD_CTRL_SOFT_RESET, which=
 the
> FUSB302 acknowledges with GoodCRC, raising FUSB_REG_INTERRUPTB_GCRCSENT. =
When
> fusb302_irq_work() -> fusb302_pd_read_messages() drains the RX FIFO, it c=
alls
> fusb302_pd_read_message() for the unacknowledged PD_CTRL_GET_SOURCE_CAP_E=
XT
> queued ahead of PD_CTRL_SOFT_RESET:
>
> drivers/usb/typec/tcpm/fusb302.c:fusb302_pd_read_message() {
>     ...
>         if ((!len) && (pd_header_type_le(msg->header) =3D=3D PD_CTRL_GOOD=
_CRC))
>                 tcpm_pd_transmit_complete(chip->tcpm_port, TCPC_TX_SUCCES=
S);
>         else
>                 tcpm_pd_receive(chip->tcpm_port, msg, TCPC_TX_SOP);
>     ...
> }
>
> Because pd_header_type_le(msg->header) checks all five bits,
> fusb302_pd_read_message() forwards the unacknowledged
> PD_CTRL_GET_SOURCE_CAP_EXT to tcpm_pd_receive().
>
> In tcpm_pd_rx_handler() -> tcpm_pd_ctrl_request() -> tcpm_pd_handle_msg()=
 ->
> tcpm_queue_message(), TCPM updates port->rx_msgid and sets
> port->queued_message =3D PD_MSG_CTRL_NOT_SUPP:
>
> drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_ctrl_request() {
>     ...
>         case PD_CTRL_GET_SOURCE_CAP_EXT:
>         case PD_CTRL_GET_STATUS:
>         case PD_CTRL_FR_SWAP:
>         case PD_CTRL_GET_PPS_STATUS:
>         case PD_CTRL_GET_COUNTRY_CODES:
>                 /* Currently not supported */
>                 tcpm_pd_handle_msg(port,
>                                    port->negotiated_rev < PD_REV30 ?
>                                    PD_MSG_CTRL_REJECT :
>                                    PD_MSG_CTRL_NOT_SUPP,
>                                    NONE_AMS);
>                 break;
>     ...
> }
>
> When the subsequent PD_CTRL_SOFT_RESET is processed, tcpm_pd_ctrl_request=
()
> calls tcpm_set_state(port, SOFT_RESET, 0) without clearing
> port->queued_message. Then, in tcpm_state_machine_work(), TCPM sends the
> queued PD_MSG_CTRL_NOT_SUPP before run_state_machine() runs the SOFT_RESE=
T
> state to send PD_CTRL_ACCEPT:
>
> drivers/usb/typec/tcpm/tcpm.c:tcpm_state_machine_work() {
>     ...
>         if (port->queued_message && tcpm_send_queued_message(port))
>                 goto done;
>     ...
> }
>
> Doesn't forwarding unacknowledged control messages (where !len and the lo=
w
> four bits of the type equal PD_CTRL_GOOD_CRC, but the full type is not
> PD_CTRL_GOOD_CRC) to tcpm_pd_receive() cause TCPM to transmit a spurious
> PD_CTRL_NOT_SUPP on the wire while the partner is waiting for PD_CTRL_ACC=
EPT
> in response to its Soft_Reset?

That is exactly the case, and I have just sent a patch [1] dropping
Get_Source_Cap_Extended from the queue separately, as they are only
tangentially related and can be applied in any order, and the current
broken behavior remains broken until both patches are applied.

[1] https://lore.kernel.org/all/20261102-fusb302-getsourcecap-v1-1-26b5bfea=
4b2b@flipper.net/

Best regards,
Alexey
