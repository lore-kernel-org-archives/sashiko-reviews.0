Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794287063;
	b=0Dh+AEJ6XQ4CM7R1+OcFmwp7JtFBDNeGnu39bSHdyD3pBty4NQcQrJZ80/TYdtEkz7Q9
	 U5FbeWHlME1XZcszxsU7ofO8e1rbJVbob1OOuGvOYgXdXcBXOkoJWJu8cUS+4GCxFbuwV
	 gwVLQTG7tMHSOIxFd66COsrqfnsPewAXfxcOXKYBeZf8D50Wgd2hLKXWkcB/PA7Ourd7h
	 qvOEe5PDGbL0UTRUlK33h9M2Ly+hiy+dG6tCzfXtLgpK7cOSrUpdpgIG5r9rujdICaSkM
	 bC30aDcujwPUxN50b3TvcIhViwrW7IZQ9cM//W9TYLnHDUGAuCq4rL9VM9q23/xq81g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794287063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Q2Yn1tisP/OswiGPs+zHZTzs8s2dnxotdAvNysGFK0A=;
	b=4P9wxNAuq9D/Y7qKAH/kmw7J+csDj8ZvFX3XT91BBm+WIUdK1hbm6/y3wIpnRI50m+LX
	 IA6yJ27Nge0sZLoUPt9CUavLDj8T7wg2NCN81F8hKErsglbAkRjYZLh+s2XLiTEX0u/T0
	 653vt6XY39197ayZlmOb2WEYocfY9/jbVwr1Y59yoioQnCd/vKICM8BGHQ7MIilQMB7t4
	 T7xgoHTswixr+UBqayBUwYr7sLNLze163f6kSk1Y6MNbbUW36ZpC2w0Lqc6kH5lmDtzhz
	 lTwHe6a/i9PzWMn9mGgV/eSEr0mBMT3YuJYV+g70BRJSwFdvvksmMiQWudE0xe/glqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="J/ZKxQHF";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4007606B0A5
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 05:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4007606B0A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J/ZKxQHF
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2857054eec.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 21:04:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794287062; cv=none;
        d=google.com; s=arc-20260327;
        b=EQ2xjNexXRSo9uuwmNzqpTu39Bw5wJqZof/OfhYzszG9fL9NSulhPXUwQ3sbhDH837
         qV/6OCrIREciuYTr+Kbys56E+sSiXnOidv2+f/lQoABYXRXdwWD2C6aWn+SWg6zUalCI
         SUqS7qSSgnSeRnprI3ex3DuncvDNUs+nSWzRDbf/LLEZUQNugKZtuhaEsTdhpO6iSomN
         WvCirrNQYTWiFX3101m9P+66blhhvpbk2jGm2Z3tLn6QubJqYAxphpYLSVQiqzaWCCxD
         xlKlD12e5c0lE9Hvi7RKKI3lTrAbdv7eTO2mopk7entLbbhf1b8Vuk31/PMSWGc2yR/2
         R+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q2Yn1tisP/OswiGPs+zHZTzs8s2dnxotdAvNysGFK0A=;
        fh=UDmiFjDUsl58/oI1pbxKLXmAuoEiB7qNSJQzd9c7Gr0=;
        b=TmHdu7Tb+Hk2tQ1I5h3bRW8FEl0AJguT7z4ceHSAEmnVDySZGb7GYhVynUodw/yZHb
         pC8gZCeyNZ4Se3WBJ2fJpXQstjZVccgIUZKYa9Jwjr5UI9JYNJeekxXwzIeI/AYEOu5s
         uVu91UxzjG5Y/N8pb9HEXO8i0pAZNjT6cUfJSvgW0FIt+6lJlhQeZJEQq2mpSEgU5mfZ
         ST12CZLEHCnMfDZs91aW8xVp4vq3gVmv8SokkGQY3UcdIPMJJc1m60ov5d7SCYqqa36u
         d47jBvfxR2Mo19zHLBbo9BO/GiMjqwUGQKUFiOg9Xk/3XtCAw6yVK5U17vq4mrIL4liy
         u9tQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794287062; x=1794891862; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q2Yn1tisP/OswiGPs+zHZTzs8s2dnxotdAvNysGFK0A=;
        b=J/ZKxQHF2dikWy+53v6iVztx//3IDNB/PD3PDMlzmOLG9WUvk96PMNc9L7EWRmXA56
         41R10W6iRHq8MF8z8BsuqQGcGXTE29ij8GyZKA9FR+9sO/Prroaw+7sq4YrUcfK47m82
         hXypjQV7cm/PeMAltQ8W/qe/DyTZ82p5zeiKl/5Urg4t7kkiaFztJMLY93Z8F2fBSERa
         BYsBS547WUHnwXs1QJniBxFmwBgZ0MuEa/SGanR+AH/guvPM2hdtqxJP8g5PQcZUXvco
         587hV25rF4N3Vo1gCXQWgbhAlsxaGiU/kYdUrDUl7iTZpferaSY96E2pAGMet8vbZrAC
         G2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794287062; x=1794891862;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q2Yn1tisP/OswiGPs+zHZTzs8s2dnxotdAvNysGFK0A=;
        b=unzGaykWi9XUC7MwrgAB88u/p3ZGvJMusDPXGbS9RgxTPvkulwsvtZ3D5K0VovlDE8
         raObNKb/DTH4QrStJvtCobY6IRjIbt2k+y3SLAfRTZoTj3fLUsRrPfU89pxOiX/xL6f9
         3TU5+HaIBhbNPjsd/v5faLqTsigltWt4tSJVJQckT7bJf+cUnXZpVm8/yKolE/8YjLtP
         BhXCOM6e4o76NqsmMfhQtopmYKqzuTGGVof7AW8tLzfsVF3YjPt5SBJjNtcQ/kk/v3BO
         jHixtHKAtOwt83gSO3sm8dSjAKV8EBYfO8kQ7GdEaw5vLS+s99W9/4mZL9L7OQE87E1U
         EvlQ==
X-Gm-Message-State: APuU4Z+IRLXwj4xdivyzzGZjuDOdsZqtJN5eZ0yiapu2aecRXHAh5AYz
	PTAGYsHwhIQ+S20alLe+nqGXTy/GQkLEUT3dPnEAJRnfDQK7KwTTkW9ApEN/C8VK4P5y/VrZ6i8
	ql2hWluCW7AS1pGkWX5cxGxCVALi2VvBVD6ANoPw=
X-Gm-Gg: AYBFou2zFlhLbLTlYx6b5nmcwRAoODEDyLPLccmlORfgl74PRcTBwJ6BK4rvXyp8fhM
	EbEnzIjaBGd8gSnxtoDm8/Bq7DaSPasMaP1xBaR3s+oEqJQm8CvZ2+ivJt61L09V+0jdZecHBMA
	loY+OdrKZyETCTaADojzL1/LIsUKNC9OYumMemfGn8hrFAKbJq4a1xjONuSyViFiS5zL22wxyQt
	STwXyYh+N1JgfL8KZKE9Hk7tUc7wJ4sLu6IIdp2zJIzbvmNCva5PYLBj3xF9XU4O6mBEFOj0Lyf
	Ygs2WEg6EpDcPWvNev2tk79py9bzIy+vna1tA74M+2JBaMMko7NbCL8CubkODJI3SiZP4fpTbPx
	HJczfRZhIfpXwW/cycd1Q4AJxuGFQW9vzy+ei0KyLTThhO48AzCkcmOIN2SXB0ibz1k/W
X-Received: by 2002:a05:7301:4d14:b0:375:4f3e:643d with SMTP id
 5a478bee46e88-3754f3e6572mr1366564eec.27.1794287061607; Mon, 09 Nov 2026
 21:04:21 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109044911.1163505-1-hj351016@gmail.com> <sashiko-outbox-206243@kernel.org>
In-Reply-To: <sashiko-outbox-206243@kernel.org>
From: khj <hj351016@gmail.com>
Date: Tue, 10 Nov 2026 14:04:08 +0900
X-Gm-Features: AclHuK8NPclpnxbDVfdRuupti_xIrnwGoz-1etxbLKHG71lGSd6n99Oe1ZbDtoQ
Message-ID: <CAGr5VtNkwbhJSg9sFi=Lk67y9SA6ofQnpuBFa2NrKy8=mUecmQ@mail.gmail.com>
Subject: Re: [PATCH v2] can: peak_usb: pcan_usb: shut down restart timer on
 free to avoid use-after-free
To: sashiko-reviews@lists.linux.dev
Cc: linux-can@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Oliver Hartkopp <socketcan@hartkopp.net>, Vincent Mailhol <mailhol@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.

You're right that timer_shutdown_sync() alone is not sufficient. The
restart URB submitted in pcan_usb_restart() is not anchored, so
peak_usb_unlink_all_urbs() does not kill it, and its completion handler
pcan_usb_restart_pending() can still run after free_candev() and
dereference the freed pcan_usb via mod_timer(&pdev->restart_timer, ...).
Shutting the timer down does not help once the object backing it is gone.

So the complete fix has to stop that URB as well, not just the timer --
e.g. anchor the restart URB so peak_usb_unlink_all_urbs() kills it, and
also cover the probe-error paths you point out (dev_free() being skipped
on a pcan_usb_get_serial() failure, and running before unregister_candev()
on a dev_set_bus() failure, with the restart URB potentially still in
flight because probe failure does not unlink it).

Since that becomes a teardown reorganization in your driver, I'd rather
not guess at the shape. Marc, how would you prefer this handled -- anchor
the restart URB into one of the existing anchors (tx_submitted) or a
dedicated one, and should the register_candev()-before-dev_init() ordering
be part of the same change? I'm happy to send a v3 once the preferred
direction is clear.

Thanks,
Hyunjung

2026=EB=85=84 11=EC=9B=94 10=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 1:49, =
<sashiko-bot@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] can: peak_usb: unanchored restart URB and timer mishandled in
>   pcan_usb_free()
> --
>
> commit 5d0ce26d62347660cb47c1b9c3037c160879b961
> Author: Hyunjung Ko <hj351016@gmail.com>
>
> can: peak_usb: pcan_usb: shut down restart timer on free to avoid use-aft=
er-free
>
> This commit adds a dev_free callback to pcan_usb that calls
> timer_shutdown_sync() on pdev->restart_timer before freeing the device.
>
> > diff --git a/drivers/net/can/usb/peak_usb/pcan_usb.c b/drivers/net/can/=
usb/peak_usb/pcan_usb.c
> > index 8fd058c328564..113b2e7453310 100644
> > --- a/drivers/net/can/usb/peak_usb/pcan_usb.c
> > +++ b/drivers/net/can/usb/peak_usb/pcan_usb.c
> > @@ -882,6 +882,19 @@ static int pcan_usb_start(struct peak_usb_device *=
dev)
> >       return pcan_usb_set_ext_vcc(dev, 0);
> >  }
> >
> > +static void pcan_usb_free(struct peak_usb_device *dev)
> > +{
> > +     struct pcan_usb *pdev =3D container_of(dev, struct pcan_usb, dev)=
;
> > +
> > +     /*
> > +      * The restart timer is armed from the restart-command URB comple=
tion
> > +      * (pcan_usb_restart_pending()), which is not anchored and so out=
lives
> > +      * ndo_stop/unlink_all_urbs. Shut it down -- not just delete it -=
- so a
> > +      * late completion cannot re-arm it after free_candev().
> > +      */
> > +     timer_shutdown_sync(&pdev->restart_timer);
> > +}
>
> [Severity: Medium]
> Can timer_shutdown_sync(&pdev->restart_timer) prevent a use-after-free if
> pcan_usb_restart_pending() runs after free_candev()?
>
> pdev->restart_timer is embedded in struct pcan_usb (allocated inside
> netdev_priv()), so a late pcan_usb_restart_pending() calling
> mod_timer(&pdev->restart_timer, ...) after free_candev() still
> dereferences freed memory.
>
> Also, in peak_usb_create_dev(), register_candev() is called before
> dev_init() and dev_set_bus():
>
> drivers/net/can/usb/peak_usb/pcan_usb_core.c:peak_usb_create_dev() {
>     ...
>         err =3D register_candev(netdev);
>     ...
>         if (dev->adapter->dev_init) {
>                 err =3D dev->adapter->dev_init(dev);
>                 if (err)
>                         goto lbl_unregister_candev;
>         }
>
>         /* set bus off */
>         if (dev->adapter->dev_set_bus) {
>                 err =3D dev->adapter->dev_set_bus(dev, 0);
>                 if (err)
>                         goto adap_dev_free;
>         }
>     ...
> adap_dev_free:
>         if (dev->adapter->dev_free)
>                 dev->adapter->dev_free(dev);
>
> lbl_unregister_candev:
>         unregister_candev(netdev);
>     ...
> }
>
> If the registered interface is brought up and triggers a restart while
> probe is still running, a failure in pcan_usb_get_serial() inside
> pcan_usb_init() jumps to lbl_unregister_candev and skips pcan_usb_free()
> completely.  A failure in dev_set_bus() runs pcan_usb_free() before
> unregister_candev(), and because probe failure does not call
> usb_disable_interface() and peak_usb_unlink_all_urbs() does not kill the
> unanchored restart URB, that URB can remain in flight across
> free_candev().
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109044911.11=
63505-1-hj351016@gmail.com?part=3D1
