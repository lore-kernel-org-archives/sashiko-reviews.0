Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6A8342CB2
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 10:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784199255; cv=pass; b=lIl3ox5vMHs1AQMn++f3f3IFy+A2CYF5hc4TJpelG2ieTYDEZHqYgu5lfMAD6y+ziWKds0dKG4UeCgbPcvy9ESJVALTbqu6ryzjpUSRnvFLv6yB6RryESrNDwz+O1tssHWa9YBz7WJn2C9c+1/h0BgTkz87XCtu7O/ZuAOeh6BY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784199255; c=relaxed/simple;
	bh=3j/moiupjcRobjxa4ND+wmxO9Q9vks2r/SEqOUGkRGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TmNVFk+Ock6xHQxu4BFHCL+8/+DcvwJLutwyg4DE6RWdwL9cX7/7GKsjXlD5fLtZWJlNidGrPxITzXU21TAAVOY/Q9WaVyklcxMvOKIu8TkucqupTEgWDTCQTlvdNQisPZcTQBzABpnXgQROK9K2QGnt5rmo3F+VqsjDwZLPKjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cSTkhGvp; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cSTkhGvp"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-664db84f074so9514369d50.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 03:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784199253; cv=none;
        d=google.com; s=arc-20260327;
        b=Dyujx+Yep7y+lrU054Ng5N4q39H6gYQ/gx8jOeJmQ/T5/LeX2gnd3MgJBY7J6zlkZL
         1Mf6Af/xIHqVhev7FHrME/Tfg+pTbEX9XTpkMS/I3yygiA9z6LhZilrrmnS8uQCfU4uh
         5BMTvM3WiDAGrjti83WMoO+7qwKBUCV34N8oKpUZC2aj2Q1yzuHeLEJMYVtoHAp11m81
         UUpTiUoPS3QS5hti4p3R7ZumGr8LLkwO77sEg561FCAFh7KhdObk1Jv8kmtvcT4hdlh6
         4q5KzLUXrnDqOHg5WCeMA1255JYTcXTjk/kedW8ZWEWnnzCs+OY9hwKRWbvQTFOH3HzI
         RUvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ye5TWESdXypHFnrQA4hoOjMY+BQZKzclNsOPs6Xfx3c=;
        fh=AIzN/SBUb8zA89HV3XI6dIT2/97pYH+rlIqvGYI6/rI=;
        b=HpYzyE6KAB0CxqR9UI0OcN/D4iZdBh+av5EfYpz3Fe9GvPQpIn+M5k4nwjDN+s7/o3
         v9L+1wH7SdDLaoe05hZBFw9oU5f9cMqNC+MUJhc0waaAa6SYMzuFaN07Ol5uhQyc/fJn
         B5h8RVaQjQz0K0mXKhRhzXL0VRX37gB+DzBphb1W/WMwUJXDg7ZXz5v0T3KiykFDIRD7
         1ndHvX774XsahSrdxKQd2TXt7bneK0YFSt5kOrNZ7Lj4TO4Tbco9zQq8LHFZ64jQZTpY
         6TydC+Uga+DEGVXRDw9HgV+oFZGrN4GS3V+8bUUWedrD65LPjaHtnIn/bj05ydJCIwZ7
         Oplg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784199253; x=1784804053; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ye5TWESdXypHFnrQA4hoOjMY+BQZKzclNsOPs6Xfx3c=;
        b=cSTkhGvpwLk1TIlN/jIYjqfIBWEEOcbjFt4mtERUEj5r/bTD/9SZoJhYVzbNgAUTiF
         T17GN+zCubsM5a4nyyC/pJo7AfYY+N0bPTysly4qRJW+mCD0eHj081KmKq5h9zjiUW4r
         zSHiLT7zQpzcs/RN0IzCY6T6aedblqjwZR8+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784199253; x=1784804053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ye5TWESdXypHFnrQA4hoOjMY+BQZKzclNsOPs6Xfx3c=;
        b=ae8C3mMmkDFnza3psTISi33n2UCd6bKcTcvKsWArwyAQXfIBo8W9AtWjK1ogYlJAqz
         pVZMbKRJqn5YUE3iEzZHw5ExeSKTaZbb83aFiB/FRmeYynMW9i11EbJ0eeFxMleL+9/C
         JI4ymWdj4puoGOCPvIZMDoJrPUDYmo55w56Vd5u+sGPYIXPngx3Ti9UbT6/eNJGYyNWa
         LxXgAD1jj7md9vATC+Mt4iGie8zQ8SV4F1NQkeGV7Cf5i6GrVUuwahoXyI/I/NF9XVcW
         XTEGgfxtJN28HbuLNkH8rsJ6aHjEcL9i0UV3PDLxuLRm4Vb2dzap5cmiXftcEOCr9Mkt
         PmEA==
X-Gm-Message-State: AOJu0Yw1msA13Bfelj1if6X8TSRvDZKBN6SaGxaQ7XIDMLnBicceXARg
	lQ2qKrtN9qpECgmbC2J9tHanN6B56YAmaiRf/FlsFclacM8QPgTaYve/+48PYG+zCFmwNd0DA7G
	xtlOHGqj/KAO0fk61QWYRj+32vgGAyoS2QPEhb1kC/dZJxQ/gwSZjkA==
X-Gm-Gg: AfdE7cmC4MR2Z8FQJwF0F/IaY2AgIl2n747HN95dJk/ky8zSX5bow08txlInCYY5EBM
	8DHN80HeYaQQY+SpnABER62lapFFZpYE2oZnKu/tPCWJope2thnQjTSzAjj1VIt/CUsuGKymR+0
	+rBC81ic0j6zO87Uhgz4Vqy+gPmxns/ucfH3dgTExOah4jgYL8cCevXwyCdk6rJeR83iLdPune8
	HpNaFhxkvgr5sDRjuWSnbCzoIfzn7qC/XVzUhoy/hv6kE7/5VNnOkPVCHsygySZBc4e6fwjKnNK
	1z9dOCznIabRqsysg1Ap/CXkUV0=
X-Received: by 2002:a53:bb82:0:b0:667:d905:3ff9 with SMTP id
 956f58d0204a3-66813443847mr3043941d50.88.1784199252963; Thu, 16 Jul 2026
 03:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-11-wenst@chromium.org>
 <20260715092814.21C6C1F00A3A@smtp.kernel.org>
In-Reply-To: <20260715092814.21C6C1F00A3A@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 18:54:00 +0800
X-Gm-Features: AUfX_mxnCgjcslak5RN3FLmB9cGAZkDHT2GeqTyJ6cvjjM1YOC7J0D8IvenEsBs
Message-ID: <CAGXv+5HM2ojf_+bbybfaNi5-TLC876-DRudnvQnOxMzHEpux8g@mail.gmail.com>
Subject: Re: [PATCH v5 10/16] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 5:28=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Concurrent sysfs `disable` read or write can dereference an `ERR=
_PTR` if `usb_hub_port_pwrseq_get()` fails.
> - [High] usb_hub_set_port_power() accesses the dynamically allocated hub-=
>ports array, which can be freed concurrently by hub_disconnect().
> --
>
> --- Patch [10]: [PATCH v5 10/16] usb: hub: Power on connected M.2 E-key c=
onnectors with power sequencing API ---
> commit e0346a1be7fb5d1254f3498bb6d857dd5db5a9d7
> Author: Chen-Yu Tsai <wenst@chromium.org>
> Subject: usb: hub: Power on connected M.2 E-key connectors with power seq=
uencing API
>
> This patch integrates the power sequencing API with USB ports to support =
M.2
> E-key connectors. It manages power sequencing during port creation, remov=
al,
> and power state changes.
>
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 10f15b40fcc55..298fb68c6afc7 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
>
> [ ... ]
>
> > @@ -887,15 +898,22 @@ int usb_hub_set_port_power(struct usb_device *hde=
v, struct usb_hub *hub,
> >                          int port1, bool set)
> >  {
> > +     struct usb_port *pwrseq_port =3D hub->ports[port1 - 1];
>
> [Severity: High]
> Can this code trigger a use-after-free on the hub->ports array?
>
> The sysfs disable_store callback uses sysfs_break_active_protection()
> to avoid deadlocks, meaning it prevents device_unregister() from waiting
> for the callback to finish.
>
> If hub_probe() fails and triggers hub_disconnect() concurrently,
> hub_disconnect() will call device_unregister() which returns immediately.
> Then hub_disconnect() unconditionally frees the hub->ports array:
>
> hub_disconnect() {
>     ...
>     kfree(hub->ports);
> }
>
> Meanwhile, disable_store() can continue and call usb_hub_set_port_power()=
,
> which now accesses the freed hub->ports array. Prior to this change,
> usb_hub_set_port_power() only accessed inline fields of the refcounted
> hub struct.
>
> Is there a way to safely access the port here without racing against the =
array
> being freed?

Before calling usb_hub_set_port_power(), disable_store() already goes
through many steps to acquire the hub device, acquire the device lock,
check if the hub is going through the disconnect process. AFAICT there
is no race.

This review comment in a previous iteration led me to try to rewrite
parts of the patch in various ways. Maybe it's missing the broader
context from the existing code?

> > +     int ret;
> >
> > +     ret =3D usb_hub_set_port_pwrseq(pwrseq_port, set);
> > +     if (ret)
> > +             return ret;
>
> [ ... ]
>
> > diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> > index 19913ad3598b3..430fc90232502 100644
> > --- a/drivers/usb/core/port.c
> > +++ b/drivers/usb/core/port.c
>
> [ ... ]
>
> > @@ -831,6 +879,13 @@ int usb_hub_create_port_device(struct usb_hub *hub=
, int port1)
> >               goto err_put_kn;
> >       }
> >
> > +     port_dev->pwrseq =3D usb_hub_port_pwrseq_get(port_dev);
> > +     if (IS_ERR(port_dev->pwrseq)) {
> > +             retval =3D dev_err_probe(&port_dev->dev, PTR_ERR(port_dev=
->pwrseq),
> > +                                    "failed to get power sequencing de=
scriptor\n");
> > +             goto err_put_kn;
> > +     }
>
> [Severity: High]
> Could this temporarily expose an ERR_PTR to concurrent sysfs operations?
>
> The port device is registered earlier in this function via device_registe=
r(),
> exposing its sysfs attributes (like disable) before usb_hub_port_pwrseq_g=
et()
> is called.
>
> If acquiring the power sequencer fails and returns an ERR_PTR,
> port_dev->pwrseq will hold this ERR_PTR. Because sysfs unregistration wai=
ts
> for active callbacks on the error path, a concurrent read or write to the
> disable attribute could access port_dev->pwrseq while it holds an error v=
alue.
>
> This ERR_PTR would then be passed to usb_port_is_power_on() or
> usb_hub_set_port_pwrseq(), which call the power sequencer APIs:
>
> static int usb_hub_set_port_pwrseq(struct usb_port *port, bool on)
> {
>     if (!IS_ENABLED(CONFIG_POWER_SEQUENCING))
>         return 0;
>
>     if (on)
>         return pwrseq_power_on(port->pwrseq);
>     return pwrseq_power_off(port->pwrseq);
> }
>
> Since the pwrseq_power_* APIs do not check for ERR_PTR, would this cause
> a panic when dereferencing the pointer?

Similar to the other comment, the sysfs callbacks try to acquire the hub
device and its lock, and then checks the whether the hub is being
disconnected before even proceeding to read out the status. The hub
device lock is held for the entirety of the probe function, which
encompasses the creation of the USB port devices and hub_disconnect()
in the failure path.

So I believe such an issue can't happen.


ChenYu

> > +
> >       retval =3D component_add(&port_dev->dev, &connector_ops);
> >       if (retval) {
> >               dev_warn(&port_dev->dev, "failed to add component\n");
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715085348.34=
57359-1-wenst@chromium.org?part=3D10
