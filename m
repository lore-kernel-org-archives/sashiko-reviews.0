Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795273637;
	b=WxvvgXOcfhoBI3RvAmnMEjUozNJd2dSPu+YMNEHDDqKGqFkUxM3sXHxjkX8c/Xo8gePq
	 bpNGerTiSM4UZejrUXYPdQs3bJpuzMQLjb2xaipshURB/ZYVzuC+Vft4uPHYTr6GhqK5I
	 DjXKHkGn2A0vMKuCo5ScJYbaCT/2dbajHXpacxVguaVZdR4ZL6K6D0hWjYXxCaOLSuTqr
	 txGgcRxMRXoUG+TUUf8ilgbKtaiWWXU08hyYHDLghkV1L64A7c+WPUavAQwq+luhXPbmx
	 GRMPuvxsXhkZd6KZaPUiLcFcbVeFQNSFXgkQOrH1eWtqmlU3qJ79J6bE7z09KH9G7uA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795273637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=9P+LQP77QaUXhnPvf9lJxnDJFTqEEgKYM6Pv7OT70pU=;
	b=4wkabWF5aPLxkHpwOl1fPcethet1kqfeN3vDHlWLJ2uC1A5M6A/eHppUJw6QrZ/l+Tr5
	 vO871PRQA19G2QHH7qJxBoI3FdWdQYJdPI/3Rzw9ByMeS33Ub4ZuvotiNXN1+8ak/fN19
	 0wJ6qzMoZ5ItNQjOeS9/6mjKzSioe5sGVLB7bfObymdG+0CKdqngI+Tnqq+RnnuewY7nZ
	 EAqAfiJprRw4/zqiGJ/BF93D8TBWNLxAAVEbbpOFA+xK9X4xTl75vhVfWmO5fSjojoESx
	 49p5pVYJFzNrVB4ID9IJgWQ7P/XEEGEYC0yKxVilSTsfwU6LH0kfoDay4i1d6oXLhzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ba+t/YR2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEFE606A320
	for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 15:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BEFE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ba+t/YR2
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f066274caeso2662505ad.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 07:07:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795273635; cv=none;
        d=google.com; s=arc-20260327;
        b=ZBNSGIn7FLaV0nc8r50s8PFmhVlAWGNGof2LYG5c5ImEZEZns0Za28iXMnG0+DVTO3
         GZQaYEgzR8cyhIx912PHKChEUduuxcfqWZrLvbSuPupGGVgfPhwZlBroVaMR3SkLCOxA
         QtPCXPG33RpUI21t+Af0GUE3JTYtMJRGMD0BB0bMVNHVms+zVeOAtEtLwZbpeg4GHYZC
         77OHjfWIGcx50U0zGdYA3a4kfHYZjH9E4N56Goaul6aJ1giDs/XvR+g/fqT9voiVH3Qy
         cpQ73IMxypGlCDOFrUED6szr27KBVsNrpCz3YqvSftcO7UBFJM8Og4XQfveEWMfAmlPc
         YmbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9P+LQP77QaUXhnPvf9lJxnDJFTqEEgKYM6Pv7OT70pU=;
        fh=gDE+ftcJgwqlFpaeVNXSL+OkXdzFf9WJRUioZc9sKbk=;
        b=Lyqbtx6QMEkB+dvjc0YODbHTfueuJLGiuytD3L3uBoRjyyRoTn4+MtMGwnHzUMRHUP
         +50gM69jAFMkd3aoeNTVSVbKMftfV98uy8/5RWwy4WfR9Rpi5raZa6zpMBYXRVz7ZicK
         NxKeECA7FXAtZsrKrOlbwU7R50Ml//YrGzjpV0PNKwrBHCpflEtKMoco2GIVV6GxJtai
         sNSeYGPoO4Q0g//cR0H/D5rfIAnYc2fnQWhZzeVt0TQUxB7CusW7XieWfpOXhmeqHpI9
         nW3Q5FYF0N3xcBy+JSdj/rprhuKPc2LLmNxT1qqHhBlRoRNYaloZ7kSVnCq+r1J4FkPD
         TUSg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795273635; x=1795878435; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9P+LQP77QaUXhnPvf9lJxnDJFTqEEgKYM6Pv7OT70pU=;
        b=ba+t/YR2b/LB5/dur3wzAWZLBol/mlkeEgAbb5qHf10GVsXDrYD8rb9c9j92jO+sbj
         phDK8f5kzNi5VOv66kSQS4uGiSHcfU9AcaIFjPyzLkS3ZhY83T+kpBQkzMpkwjkUZcpt
         WxtbCABcsjeZNItxlYRadw+ci6UItOWTZbCTlYxhOe+GAYV/StYYd3SmmcBZW5Ca9fV/
         TW33M4HPdkviqpO6+kkv4MvMYr1Aavn9UkfXqiBhUpe3Ba4gTjxOMhK42XmstExE8dp/
         TSdOZGT0OWVIwuvEPNw6HH48Ng5Ms8cFCpKyJ9QatQLEOsrCqFb/ZG3wOskCApEcOdKJ
         GU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795273635; x=1795878435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9P+LQP77QaUXhnPvf9lJxnDJFTqEEgKYM6Pv7OT70pU=;
        b=MM8zLJRiv2XHPKZ/v0bs80A49enl9Yljf27qkXEWl99obpHcl+UcYcGg8nGpUIr14E
         +a6o2ea3s8NOQNk++epqyC0EXx5P5NbNU+kzIO4UmTZo/Nap4YdZKoWWjVxLi0z4HsnE
         XbV2Du3N6Q+zQn05IdriazPjPkbR77P5iyhvFTbVqBnyPxA2sMTEJK+fttCM8QLZbKBR
         4vnzGfetuPA813UFU2khw77RwIOnvxgJ5QxDU0KUW3oiF1DCVqVOQvogfcnl9Pk4lqIr
         Z6b02D+RIGMRvBlT4gr6AZPXKLFBdyV8OZWQlQzDhwAjw/+o8TlWtuLUTDTXKz4mSVC3
         +/HQ==
X-Gm-Message-State: APuU4Z/IxxpX5OdFknC1mI6qjmZTOBn08kzW4cMKbDSE7ALKOFTGPFCw
	nRdENfzO1UXdHYcyhp4nM2I1VjMOz6vCOcwF9ULytO5yE8BNeldRgqfMQSKVPiLI63DuQxpEasc
	8/LeJKmdtye85uZHKJd2gb3bazFzdz4hdUvfL1dfmy9to
X-Gm-Gg: AZFdTZfEFS5zRZ+CgdDX/2KVrLOAqT4YU8xlgqJcvnNQVejGncNlMCL67+cTxitYt7l
	hWMGs2TQ/llhlDoNRNo+934NAvJKZsh0OcHXh9vNT0EQailesTJ5BBNxdJ6nyfGvy0WnkZYd+x/
	EJIaFrruaWT0eIlSISnz+k9q7NDHRL7/Nx0Axx3793EVv9QjSlJNn8rBIeeX9DgIeXvyDbPJ2ue
	DbQpF2LYLOvHI5I1W4KaZ4ou+F+nRAXnLbnZjkC36EXrQesn40xLtgzN2NeJrC/W3G9nLi2wnrP
	FPCBCCxz8aFEsurEM/qXzmGFujsfihKIIfkvzKlXEkmRt2igxAH2P5TaBp9I4QTY+LlPckAgr6t
	Mgta2zC5Sf2Bskz9Wrpv2eossreZemxLZPCue1KPIWobxa7HVHbYm38s+cPbrhtNf+ywv1UB90e
	+QTJN6YDegrrdMH1hAGN7VqjcG
X-Received: by 2002:a17:903:2f4d:b0:2ea:9012:649 with SMTP id
 d9443c01a7336-2f03f1ec317mr73144255ad.57.1795273635478; Sat, 21 Nov 2026
 07:07:15 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261121070804.26185-1-alfonsocvu@gmail.com> <sashiko-outbox-226770@kernel.org>
In-Reply-To: <sashiko-outbox-226770@kernel.org>
From: Alfonso Villalobos <alfonsocvu@gmail.com>
Date: Sat, 21 Nov 2026 09:07:04 -0600
X-Gm-Features: Aa3M54rGHRzfUSOp8ujaJxpTAz5H4ROSkXJLOnO3uUt3NShcUdp4Z92hpWXGRLI
Message-ID: <CAJ=mrFowQNahOjD-NQzcuJCjPE=efvDK85kMpseRUrqYBwX3Sw@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: Re-add host router DP IN adapters after DPRX failure
To: sashiko-reviews@lists.linux.dev, westeri@kernel.org
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, YehezkelShB@gmail.com, 
	Alfonso Villalobos Ulate <alfonsocvu@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mika, hope you're having a great day.

I'd like to check the direction with you before doing v2. After the
Sashiko review and looking closer at how host router DP IN adapters
are handled, I'm not sure v1 fixes this in the right place.

The DPRX failure happens when the RX 9070 XT feeding 0:10 is in BACO.
With runtime PM disabled for the GPU it always works. After the
failure the host router never sends a hotplug for 0:10, so it stays
unused until something triggers the re-check from v1, here me
replugging the dock at 00:27:26:

  [00:26:36] 0:10 <-> 1:11 (DP): activating
  [00:26:36] 0:11 <-> 1:12 (DP): activating
  [00:26:48] 0:10 <-> 1:11 (DP): not active, tearing down
  [00:26:48] 0:10: DP IN resource unavailable: DPRX negotiation failed
  [00:27:26] 0:10: DP IN resource available
  [00:27:26] 0:11 <-> 1:11 (DP): activating
  [00:27:26] 0:10 <-> 1:12 (DP): activating

The DP OUTs also end up swapped, so the ordering part of v1 doesn't
work as intended either.

The comment in tb_dp_tunnel_active() and the redrive code both seem
to expect a hotplug for host DP IN adapters. Is the ASM4242 supposed
to send one once the GPU starts driving the DP IN? If this is
ASM4242 specific I can limit the fix to it with a quirk.

v1 also only recovers on a new event. The alternative I had in mind
is retrying the DP IN a few times with a delay after DPRX fails, so
it recovers without a replug. Which is better?

I already have fixes for the Sashiko comments (the missing
tb_exit_redrive() and the ordering in tb_dp_resource_available()) and
one to skip DP IN adapters that are already in a tunnel, but I'd like
your opinion before spending more time on it.

Thanks,
Alfonso

On Sat, Nov 21, 2026 at 1:25=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] thunderbolt: missing tb_exit_redrive() in
>   tb_add_dp_resources() leaks RPM ref
> - [Medium] thunderbolt: list_add_tail() in tb_dp_resource_available()
>   breaks DP IN order
> --
>
> commit 4eedd8886dc180b45204d935f18725051dd0e6a0
> Author: Alfonso Villalobos Ulate <alfonsocvu@gmail.com>
>
> thunderbolt: Re-add host router DP IN adapters after DPRX failure
>
> This commit re-checks host router DP IN adapters when a new DP OUT adapte=
r
> becomes available or a device router is scanned, keeping host DP IN
> adapters ordered by adapter number on tcm->dp_resources.
>
> > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > index 418ad0a61a5de..1f3dea836067e 100644
> > --- a/drivers/thunderbolt/tb.c
> > +++ b/drivers/thunderbolt/tb.c
> > @@ -109,6 +109,29 @@ static void tb_queue_hotplug(struct tb *tb, u64 ro=
ute, u8 port, bool unplug)
> >
> >  /* enumeration & hot plug handling */
> >
> > +/*
> > + * Insert a host router DP IN adapter so that host DP IN adapters stay
> > + * in adapter number order. A DP IN that is re-added after it was
> > + * dropped (for example because DPRX negotiation failed) then gets
> > + * paired with the same DP OUT as before, instead of swapping DP OUT
> > + * adapters (and therefore monitors) with the other host DP IN.
> > + */
> > +static void tb_add_host_dp_in(struct tb_cm *tcm, struct tb_port *port)
> > +{
> > +     struct tb_port *p;
> > +
> > +     list_for_each_entry(p, &tcm->dp_resources, list) {
> > +             if (tb_port_is_dpin(p) && !tb_route(p->sw) &&
> > +                 p->port > port->port) {
> > +                     /* Insert before the first higher numbered one */
> > +                     list_add_tail(&port->list, &p->list);
> > +                     return;
> > +             }
> > +     }
> > +
> > +     list_add_tail(&port->list, &tcm->dp_resources);
> > +}
> > +
> >  static void tb_add_dp_resources(struct tb_switch *sw)
> >  {
> >       struct tb_cm *tcm =3D tb_priv(sw->tb);
> > @@ -118,6 +141,9 @@ static void tb_add_dp_resources(struct tb_switch *s=
w)
> >               if (!tb_port_is_dpin(port))
> >                       continue;
> >
> > +             if (!list_empty(&port->list))
> > +                     continue;
> > +
> >               if (!tb_switch_query_dp_resource(sw, port))
> >                       continue;
> >
> > @@ -130,7 +156,7 @@ static void tb_add_dp_resources(struct tb_switch *s=
w)
> >               if (tb_route(sw))
> >                       list_add(&port->list, &tcm->dp_resources);
> >               else
> > -                     list_add_tail(&port->list, &tcm->dp_resources);
> > +                     tb_add_host_dp_in(tcm, port);
> >
> >               tb_port_dbg(port, "DP IN resource available\n");
> >       }
>
> [Severity: Medium]
> Does re-adding a host router DP IN port through tb_add_dp_resources() lea=
k
> the runtime PM reference on sw->dev when the port was in redrive mode?
>
> On host routers with QUIRK_KEEP_POWER_IN_DP_REDRIVE, tb_enter_redrive()
> sets port->redrive and calls pm_runtime_get(&sw->dev).  When
> tb_add_dp_resources(tb->root_switch) now runs at runtime from
> tb_scan_port() or tb_dp_resource_available(), it adds the host DP IN port
> to tcm->dp_resources without calling tb_exit_redrive(port).  Any later
> tb_dp_resource_available() call for that DP IN port then returns early
> because the port is already on tcm->dp_resources (or already enabled by
> tb_tunnel_dp()), leaving port->redrive set and preventing the host router
> from suspending.
>
> [ ... ]
>
> > @@ -2234,6 +2272,14 @@ static void tb_dp_resource_available(struct tb *=
tb, struct tb_port *port)
> >       list_add_tail(&port->list, &tcm->dp_resources);
> >       tb_exit_redrive(port);
> >
> > +     /*
> > +      * Host router DP IN adapters removed because DPRX negotiation
> > +      * failed never get a hotplug event of their own. Give them
> > +      * another chance now that a DP OUT became available.
> > +      */
> > +     if (tb_port_is_dpout(port))
> > +             tb_add_dp_resources(tb->root_switch);
> > +
> >       /* Look for suitable DP IN <-> DP OUT pairs now */
> >       tb_tunnel_dp(tb);
> >  }
>
> [Severity: Medium]
> Should tb_dp_resource_available() also use tb_add_host_dp_in() when addin=
g
> a host router DP IN port?
>
> When a lower-numbered host DP IN port becomes available via hotplug in
> tb_dp_resource_available() (such as when exiting redrive mode or after
> resume) while a higher-numbered host DP IN port is already on
> tcm->dp_resources, list_add_tail() places the lower-numbered port after
> the higher-numbered one, breaking the adapter ordering that
> tb_add_host_dp_in() maintains.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121070804.26=
185-1-alfonsocvu@gmail.com?part=3D1
