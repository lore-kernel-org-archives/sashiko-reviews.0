Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2289847A0A9
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 11:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806047; cv=pass; b=c4N4jxkp61sNz0Ff6IbEgHDyC/RKeRazadb59Ok8CMJZfwUi997MLu5Hh9pq55bTEXHvXYdgZ4pGvxAJKiPFVselURSznYduP3l0ScBZmxzQ55b+xDPEb7Oh9tB8/ElqR8gYRl2n/apOfZ8/bOzI4751jybkXtc/+MupQWUXN8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806047; c=relaxed/simple;
	bh=W+yrOJzDyJ5PqiI4NfkV+QKWr+nkMYZHtZnIaIFG8QA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XaDnACz14jUPci6kvATevXK2T/r4T3KMJ7vnIlXbyEfaIQF7PDhOrb3UcwgCwxIq5sUO7u9UjcSy8A7Ax1s/UBnBTTeqDD97wPneSzPW87B83I76tlbrqgRImlkkaSjmkKh4OqSZbMjzrj1bK+IrAw1sRyx9m30XZcVboAGNki8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QxXeoS2M; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QxXeoS2M"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so9309a12.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 04:54:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791806044; cv=none;
        d=google.com; s=arc-20260327;
        b=j0q0oh4eue9jNRKOc/2D3LIxrKIkYWGShd+wnzzsitBfx90B764Z+eamyfwy/cGpuh
         NjKfUULWY/uHcTLJT+hKvyjLXTuGaGRfFNZLuj8ty95n//lthcKiZGSjceEgu3D05jZY
         bWdQ2bdDYnm5pWyELdCgTV7Ah2MdG5/pf44C3mNxAbisfIuMbv6bFatmyahXbimLR/Gl
         5qwI8O4s1pqV4Pq7IyCSWHYQb/EVE2rf2yj3hFkdeVmE92PJdBX/ervCVd0eITs+IAh0
         sO54JxNZE7DKHlhd3+gg4Y5Mnyhl/7izVxmMv/nULL/AEWNtt5ZxJJXp9vQtp6mP0cyF
         yfVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X0xFSevncYFBAZwCKQnA0WXvbjVSUftRrMQuoOTk7P0=;
        fh=2E8G5L5HRIhYv0SLHRh0bmuG4bK/RxhrEd6+zC1U6gY=;
        b=gnpCQS03yyrUQXtOa6vQDAxozdis+p7SXTSYXlSmFOk7toeQt73e+TacfVFCW78oP0
         gkVNdpP4eHV8048tZ83/6DfHtoQe5eNHNbYByfC8o03H6UqGBA+YYyvUBb3fh2Ch1JmD
         RCOIEhKwBeYrlO/EbfS/iJdu5uKIXb6d33VTaX1SkvmFmVL/kR+WjheF7ugRNTrmtmmu
         p8ou47D6EOz5BTi1hYfpgj1cgc+6Qab3Tgew8o+xbGO4uS+lPSNHRhl0525QhlIxrTp0
         UT2dpZAYdHzOmkWkGE281FSeLTCKeFbFVImPWRZbLSU4kLAZtJ40eGEm51vfGTHap/YB
         N3Fw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791806044; x=1792410844; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X0xFSevncYFBAZwCKQnA0WXvbjVSUftRrMQuoOTk7P0=;
        b=QxXeoS2MxFGQC3kpmuo7gb+gBZYh+RHso7oHzDEnZkFuV0XzTEwvcvwu+itRLTWX23
         /6U9qlYxEXPHaxqs2EGEgGYtAF0iqiD/G8hGlgrMts2UZ0Bwmnic+Bo2f2Yo1cA7Fe84
         b5UO77O9lPEPnfgUEc1ZFVKAP+wqL7BF1+ixSVNhq2l5x3rmPEZta3QhZfT4e1VKN+9B
         MLgWh0CBl4Q2Jv1n14rIv5gV9q5WBk5mpIhqq0j7GeyJzjApph+fsTAHEXugl0G+c6kM
         wfvuxya2XpLCeTNJZoULUbd4hfw45GzMEEyR78semKALPg+2J83WehLbPo4iGWRObbEN
         ZPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806044; x=1792410844;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0xFSevncYFBAZwCKQnA0WXvbjVSUftRrMQuoOTk7P0=;
        b=wI3Mw4DpI8Fz6H+5jrCs5hKvNsQwgWn8f9amAZwic+DYhnspXKbH95CMoiJWR5qTV3
         ZaLAC+EuYpbBuqiYqXMxhbWCuE/9VHgDCiinCbMloYv+1GXcQveMoeoncuhxmGNK4REV
         2hun5FBS2WxFYHAirNgyRh2xGlwgQvqQBPbX11NYNh6ONl56mt+arDNQODp+D45G3MM+
         Y9cEaZKQZEg1nRyph2qx5F8PAnD0tZkTyTQj+M2LV4ke/6CUklhfHr1bKpfJ+XGcYuJk
         jja7s5rixmmYdFxt9H+NqxiyrCcOxvJKkIuPRpFdWX1j1t9jGw43Lqi3TuqQSzBxJPGL
         SvMA==
X-Gm-Message-State: AFq9FYJ5/O0OKx6zqD2tDouqv6csW37T/C30DLYzH772aBj44uU0BwDi
	gR399+dqKuGgKqxWtct75ddpvYWygvLO8UbAcfqoDXM9Ic+blYN/Qav271p5OZvSoLqV40/xzfK
	BeaUVDjZKRR6/nlqDAP4elbNvSR9fHbETtqO6PAKJSu2+nJHI3My7yIQK
X-Gm-Gg: AYBFou0RvtxA1izdQfCp2vpLUO/sDSslabWOAcvHxRkQL2qfKpSDryvPOghQE15TwnJ
	d1YGvberzunAoGd+viNUY2mEyUFwo3JBI2ElqH3gQa78/WoYrzL9fnw6LBQ6laadJ3U0LgF19RT
	zusWeEFmMuYnLicB71xhQOWNuL3cb8gG2TZCk6xD2z0cCFn1AaYk2wlm0CZZN6ZJyHqIP0N5ShW
	3cnGWb2qhsbWvQaTNf4jD87sZ6mWh6DoLl5Cm9IK7miiqaatkrKbJ2wGPXXh5b6G4R5kXTfPcmJ
	1AzgNJUxfpwFI32ATDbj9Sv8KR+dsvFg2Kzf/KlWzdO97fbxLwppjyxxaNqGQK+EzLiNpMGuz3H
	itv/HrtQacQ==
X-Received: by 2002:a05:6402:c4ce:10b0:6af:97a9:224a with SMTP id
 4fb4d7f45d1cf-6b19883993fmr48978a12.2.1791806043720; Mon, 12 Oct 2026
 04:54:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012114213.1757207-1-mclapinski@google.com> <sashiko-outbox-168028@kernel.org>
In-Reply-To: <sashiko-outbox-168028@kernel.org>
From: =?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>
Date: Mon, 12 Oct 2026 13:53:52 +0200
X-Gm-Features: AclHuK_IudBD0PSNt8K_aewjV-AkAYybXJ2qyIG4OhunkQvG5CHoSq9_LjtJiv0
Message-ID: <CAAi7L5eN7p42d-5tEgGkhBUDCw7Q2gWfys9qLvqp5yMbfLJnBA@mail.gmail.com>
Subject: Re: [PATCH RESEND] PCI/DOE: Poll briefly for a response before sleeping
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 1:51=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] pci/doe: CPU busy loop when HZ=3D100 due to PCI_DOE_POLL_INTER=
VAL=3D0
> --
>
> commit 16e5277536bbca37386848082d18257e2ffa71dd
> Author: Michal Clapinski <mclapinski@google.com>
>
> PCI/DOE: Poll briefly for a response before sleeping
>
> doe_statemachine_work() waits for a response by sleeping
> PCI_DOE_POLL_INTERVAL (PCI_DOE_TIMEOUT / 128) between status reads,
> which is 7 ms at HZ=3D1000 and 4 ms at HZ=3D250. Exchanges are served fro=
m
> the device's local mailbox logic and typically complete within tens of
> microseconds, so nearly all of that sleep is wasted. Every DOE-capable
> endpoint pays it once per supported feature during enumeration.
>
> > diff --git a/drivers/pci/doe.c b/drivers/pci/doe.c
> > index 6b5d9ba8e9697..5e93d78a1a97e 100644
> > --- a/drivers/pci/doe.c
> > +++ b/drivers/pci/doe.c
> > @@ -27,6 +27,9 @@
> >  /* Timeout of 1 second from 6.30.2 Operation, PCI Spec r6.0 */
> >  #define PCI_DOE_TIMEOUT HZ
> >  #define PCI_DOE_POLL_INTERVAL        (PCI_DOE_TIMEOUT / 128)
>
> [Severity: Medium]
> When HZ=3D100, does this integer division truncate to 0?
>
> If PCI_DOE_POLL_INTERVAL evaluates to 0, it permanently breaks the fallba=
ck
> sleep mechanism.
>
> > +#define PCI_DOE_POLL_FAST_MIN_US     20
> > +#define PCI_DOE_POLL_FAST_MAX_US     50
> > +#define PCI_DOE_POLL_FAST_TRIES              40
>
> [ ... ]
>
> > @@ -525,10 +528,25 @@ static void doe_statemachine_work(struct work_str=
uct *work)
> >                       signal_task_abort(task, -EIO);
> >                       return;
> >               }
> > -             rc =3D pci_doe_wait(doe_mb, PCI_DOE_POLL_INTERVAL);
> > -             if (rc) {
> > -                     signal_task_abort(task, rc);
> > -                     return;
> > +             /*
> > +              * Exchanges are served from the device's local mailbox
> > +              * logic and usually complete in tens of microseconds, fa=
r
> > +              * below the jiffies granularity of PCI_DOE_POLL_INTERVAL=
.
> > +              * Poll for up to ~2 ms before falling back to it.
> > +              */
> > +             if (tries++ < PCI_DOE_POLL_FAST_TRIES) {
> > +                     if (test_bit(PCI_DOE_FLAG_CANCEL, &doe_mb->flags)=
) {
> > +                             signal_task_abort(task, -EIO);
> > +                             return;
> > +                     }
> > +                     usleep_range(PCI_DOE_POLL_FAST_MIN_US,
> > +                                  PCI_DOE_POLL_FAST_MAX_US);
> > +             } else {
> > +                     rc =3D pci_doe_wait(doe_mb, PCI_DOE_POLL_INTERVAL=
);
>
> [Severity: Medium]
> Does passing 0 to this wait function when HZ=3D100 trigger a tight spin b=
ug
> instead of yielding the CPU?
>
> Since wait_event_timeout() immediately returns without sleeping when the
> timeout is 0, this regression results in a tight CPU busy loop spinning o=
ver
> pci_read_config_dword() continuously for up to 1 second during enumeratio=
n
> for affected hardware.

Yes, but it's a preexisting issue.

> > +                     if (rc) {
> > +                             signal_task_abort(task, rc);
> > +                             return;
> > +                     }
> >               }
> >               goto retry_resp;
> >       }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012114213.17=
57207-1-mclapinski@google.com?part=3D1
