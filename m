Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794489414;
	b=iRRTQuTc0N45I7nbgW3tWz5Uk06KZERTJVipAQDP1jNmZvTBiyi92V5TAnGjfNQdjQAn
	 fKT7ZBTI+xucdgSSqFYoCQ9XBepkiBuba0X80wXJqbVq+L4MFLBzCQ22cCFV+Xd/wB1Gs
	 P7MmGmqBn4331GH2yQ+89Z6yZt7T8R18RuXpgKBu0ZryirJf1//bEQphnTi7qOk8eaZAw
	 UCqhmExY5O/hG5OCPaV8rOiAUWXjhzncVGunALIX/bFJDluKDpPpTJ0u7fg0T1A55QjNx
	 u0ThzYbqhys1sJYnorKJ8HMVIeCOuhu84NqM4yN9jPoeTesqyR5eZ1c3PHgIDfvE4Sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=IhzF0+tcNo5kCDahctjPTIknxC8jK7QawDXcg2iqpig=;
	b=23+3PeGEAyo8z0rulIkjwWSKTtTl1htGS8sNPS4r5gdGuDtMVCkoHipnADLKBKjsZmPg
	 SL2y30/5zxZoiD6QfiSF7VL5TAkfGXWJsLYcenurdoAdFYYBdMdNMbk04yeNVl4JRF+zA
	 atgURlKQKaz9Bl2ZNC791nJAd2wfI8yOkWTVnc6rW2TXVm30JlNk9Odk7qOHlEg2WEpeb
	 jdeoIeIYbdvuxdLiBYpJjWxJn36HkaQRxk4TlWHIqiKOPmr66WajriC7McGLRa4RWn4JW
	 hR0ad4u3O2KcpJU9LaGg38zkKcqBgcF9m4sGuyA19kMchzjpwuf16TmqmVzRqt5Oybw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OL6mCssb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAD9606A8B2
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 13:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DAD9606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OL6mCssb
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so2448972a91.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 05:16:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794489413; cv=none;
        d=google.com; s=arc-20260327;
        b=dHWl20tE/KrxLB5LqMWwP/TJSoax1JoeTkloULtCDzMQ5AYW1tyOrqk0zZkmCMGRwe
         fYE9cMx2IzDHMmO0pcWUR3923LpVLaD7r1bo8QZ2HKIRRPLq2lIun9EQGuVYvFAbMIgW
         i2WPH98YRMyDsvEHjjJHR74RDA8DNwsTUhDF7K1YU1ISH6Ox28HzTd/kOk6aG20dTlIw
         gvA/oLNEhzCEQ6xxkuoP5k7UPMU/sSF3RezuLLqE47GVJS9DMtza5OfkGU/oLfw1vuxR
         KCFUmqzDp7gtcYI0N6Y9V6cFnrC7NNq3zwlpgLPkXuMv2hv6Uuhj1DOdt4TcDOKEkY8k
         SjoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IhzF0+tcNo5kCDahctjPTIknxC8jK7QawDXcg2iqpig=;
        fh=/QP+n2O4Hyc4wPS4zFFRlhIZQ4uvqm/l12+HjjpmfsY=;
        b=ar/Db8a100ufiSxbvuW1xFwXLWPrQ6EYtL7aa+t37RenGIdZZ3xm3Lbq6ReqHC+IH2
         rlTwebhkZBJSPTJtCUe2HnXsfMKJWj7mFs5dtk1DT05LXZqH3wPK0IQZ/SZPptQ4c9uA
         IIbwqIXKPJ7GKzPDq1Ca0PpXGsQJrDOZ88B0Mb46EozmxbMXxeL8KH7tMbzY4Kb7V1sn
         vYiY+Gmq1jHOgUf7vj0+qF2dnHa78laRF65pnC3DZwyP1/r6r4MLpO+dWuIPB+HuSiuX
         1S5AoOhm5mGmKiwBpYan2HWUDgMC1bN8u07SzqqKIUIrmPg6C5T4FylY0gz42SRAQ8H/
         pr8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489413; x=1795094213; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IhzF0+tcNo5kCDahctjPTIknxC8jK7QawDXcg2iqpig=;
        b=OL6mCssbgg3VOtShcf5jlpOS18Xo4SJpyyLCo7hPc+HNdmWDNp6FFoMZ73ZYE6L2S6
         pu9X8lZBIqU6nR8Bkw5qcwCLXO3/TtGy6lMsYxZWK3aotjqodGH4PMu32ERbPA4ik4Dj
         mFnECv+ylX9SB7CmzakcWclG2gNQ5iDDQhQsHlnHhzmtNj+c3A9AahCXlbBRWjAQkhoP
         svlr2pOZhdwJ/p8Tf3wOCYMvIshJEdIuYDH3Z8gtzV35U2aC9DDPy+xzg1o6PMpQnmKF
         rYqqvj5Xk305Bym44bPC+MQGSdu0acWWt2OlTHy5W6keg73PTCPimjRpUfzDHFYVpg3j
         SjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489413; x=1795094213;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhzF0+tcNo5kCDahctjPTIknxC8jK7QawDXcg2iqpig=;
        b=cwM2rOcxXQXhnQZdDMHQbwKmGGA8a8hvzJE3ATRQZdp5J+P34mvYOmk7JI4uEUKdxV
         VAUqQQ+mp5uc9S4JP1BmSctOEkxb+5E42S8bY4Dukvbx2vhCMDnAbWAvdfJ37qCgVhWC
         sGVrNeLu2h5bdCMyu4Hj8sjAxFqoEhdK0K9/cnrnx2xKeYrE817QUo3EdZ90clBfAvj9
         u11trN6cWjjjqNL+j6COSIpno2bZ5KdSzq0wQNgxvh040e7J7lj6gqP8OXU6Z9KYd/Td
         9x1icrgz7HgfrYOOzVBygu7LuHLJurpofCW8/AcrbnW69BKc+SA7J7oll0fSiNgcfTGb
         7exg==
X-Gm-Message-State: APuU4Z/Hd1VTP7UVmGYU5mEcCOVzdpSqZ3tKEclB6TIGRF13blsBZRSp
	bznDPq4UVLs+i8TqBZu19zX4O8TePvdqZ7uKCh9SBX/Pv/X+qWGru7kQqXzKEHd8jv6MaLbS327
	KqaEQcSRYwzeKBbSRT2IZmMEDi0P4pEOcYM0JMw0=
X-Gm-Gg: AYBFou2Q2XnKo5VNmwZbTyDDPbhdWBpLA9HhyQA5HdF115fbnEV6FIBDWo+yVGs6Rua
	hwwQLSBcqDdIYNSP4/nKaizDN3k22lvzwj1iwVtxKxwhjVJNO7sUQhF/y1GGLjqaPIY9E1ZBD+r
	bCaOm/dSCBus3Mh6zWOroIhJo8uZmyNdS/IKfQ08gp3IVGaRRxTKtGbNg4cgOA45i2H2UjLRgzl
	wEjT+E0Yq/+XRaxH4FGNBp8GYmonSIeU5sXISBqTKf/sXVIRy84adeFvZyBt3FJABtKbtG8Rphz
	nMTXJG/mRtrUDDbI9tEBRVs3RJXEDVVzMhUxkvNWSPszZzNSS3Y0eahR+PNW9NVYzghSR5qe/vI
	Z6jHDYi4tVmOf86ff0AzmEdzVyPmMoS8NabFUrM2gFNKehxyp4Y3LYJt9FvJmppX9faAPqg==
X-Received: by 2002:a17:90a:b107:b0:3b1:83aa:5b53 with SMTP id
 98e67ed59e1d1-3b183aa5ed3mr3810832a91.58.1794489412974; Thu, 12 Nov 2026
 05:16:52 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111-vt8500-serial-cleanup-v1-0-b33594a25f87@gmail.com>
 <20261111-vt8500-serial-cleanup-v1-1-b33594a25f87@gmail.com> <sashiko-outbox-209587@kernel.org>
In-Reply-To: <sashiko-outbox-209587@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 12 Nov 2026 17:16:40 +0400
X-Gm-Features: AclHuK_EzwJVOg4AvJFgWeK4zwSmKMqdVxsBfBYhFYya4Gb1hOc3LGAcrZC_RjQ
Message-ID: <CABjd4YyN0aj_AY+GmsREkq7LavmSJRB2c61JyMR2yn7eiEkwMg@mail.gmail.com>
Subject: Re: [PATCH 1/4] serial: vt8500: Find console ports in the serial core state
To: sashiko-reviews@lists.linux.dev
Cc: linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:42=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] serial: vt8500: direct access to private uart_driver.state field
> --
>
> commit 97ad19d6dd8fe51bf33a0dd201b9aa1860b0702f
> Author: Alexey Charkov <alchark@gmail.com>
>
> serial: vt8500: Find console ports in the serial core state
>
> This commit removes the driver's vt8500_uart_ports[] array and looks up
> the console port via vt8500_uart_driver.state[co->index].uart_port in
> vt8500_console_write() and vt8500_console_setup().
>
> > diff --git a/drivers/tty/serial/vt8500_serial.c b/drivers/tty/serial/vt=
8500_serial.c
> > index a7f167a734160..6c53e108756a8 100644
> > --- a/drivers/tty/serial/vt8500_serial.c
> > +++ b/drivers/tty/serial/vt8500_serial.c
> > @@ -444,7 +444,6 @@ static int vt8500_verify_port(struct uart_port *por=
t,
> >       return 0;
> >  }
> >
> > -static struct vt8500_port *vt8500_uart_ports[VT8500_MAX_PORTS];
> >  static struct uart_driver vt8500_uart_driver;
> >
> >  #ifdef CONFIG_SERIAL_VT8500_CONSOLE
> > @@ -472,28 +471,27 @@ static void vt8500_console_putchar(struct uart_po=
rt *port, unsigned char c)
> >  static void vt8500_console_write(struct console *co, const char *s,
> >                             unsigned int count)
> >  {
> > -     struct vt8500_port *vt8500_port =3D vt8500_uart_ports[co->index];
> > +     struct uart_port *port =3D vt8500_uart_driver.state[co->index].ua=
rt_port;
> >       unsigned long ier;
> >
> >       BUG_ON(co->index < 0 || co->index >=3D vt8500_uart_driver.nr);
> >
> > -     ier =3D vt8500_read(&vt8500_port->uart, VT8500_URIER);
> > -     vt8500_write(&vt8500_port->uart, VT8500_URIER, 0);
> > +     ier =3D vt8500_read(port, VT8500_URIER);
> > +     vt8500_write(port, VT8500_URIER, 0);
> >
> > -     uart_console_write(&vt8500_port->uart, s, count,
> > -                        vt8500_console_putchar);
> > +     uart_console_write(port, s, count, vt8500_console_putchar);
> >
> >       /*
> >        *      Finally, wait for transmitter to become empty
> >        *      and switch back to FIFO
> >        */
> > -     wait_for_xmitr(&vt8500_port->uart);
> > -     vt8500_write(&vt8500_port->uart, VT8500_URIER, ier);
> > +     wait_for_xmitr(port);
> > +     vt8500_write(port, VT8500_URIER, ier);
> >  }
> >
> >  static int __init vt8500_console_setup(struct console *co, char *optio=
ns)
> >  {
> > -     struct vt8500_port *vt8500_port;
> > +     struct uart_port *port;
> >       int baud =3D 9600;
> >       int bits =3D 8;
> >       int parity =3D 'n';
> > @@ -502,16 +500,15 @@ static int __init vt8500_console_setup(struct con=
sole *co, char *options)
> >       if (unlikely(co->index >=3D vt8500_uart_driver.nr || co->index < =
0))
> >               return -ENXIO;
> >
> > -     vt8500_port =3D vt8500_uart_ports[co->index];
> > +     port =3D vt8500_uart_driver.state[co->index].uart_port;
>
> [Severity: Low]
> Should vt8500_console_write() and vt8500_console_setup() reach into
> vt8500_uart_driver.state directly?
>
> include/linux/serial_core.h:struct uart_driver {
>     ...
>         /*
>          * these are private; the low level driver should not
>          * touch these; they should be initialised to NULL
>          */
>         struct uart_state       *state;
>         struct tty_driver       *tty_driver;
> };
>
> struct uart_driver::state is marked private to the serial core and not
> meant to be accessed directly by low-level UART drivers.

This is true, although sh-sci.c and xilinx_uartps.c reach into .state
directly currently. I'll add an accessor instead as part of v2.

Best regards,
Alexey
