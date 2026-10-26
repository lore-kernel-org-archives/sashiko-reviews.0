Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793054920;
	b=wrmeRAXf/spkId2HVL5wX+VQFPuq4pW2IHY+zUEiQrYPcqMZ8MmBJ3MVReCuT1UHkoTi
	 PbEWqN3T7F3Glg31FFmTzIObtPm6zOG6mkd/GBx2ucwa2VhnpAqSEMtfyQWmWvYlNtOCi
	 RTuZ24V6ipYK7oJzG5YMtcQsMgTH6Y0r8xAbz68KSCqAy1W8ILEQzNTJsao2OoUheF5Mc
	 PkKrOtXIoRmiXdPzyOtzwCLBn4HPYzoNkgpoLqK7spK+L1HRkWsFO7kDDxOBnXMCsL/gR
	 h/3AyEAq8uRuzG4T1l3krK+MW4IwNh5MT1f7j5DHK6+Vx/gwQwFyKNTXMyzEar3fgOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=mshdBP7zWJ8tsttLUx6xhnibBdLHVDUK/dBlFucrT6E=;
	b=dfHPXydjGj6u6cB+9MDo9/CuOTm6BuVLZJjUxmjWhxFAUuP7fiz7F769E1/e/v5urS9k
	 OFpXGQhVVHVwel7ZpPLJvtUjMolR27Pj16vf9KYvKwq9JTPshq5H3zHTKZ0Labvozv8KZ
	 iP6kMfHVwvQTZ2q07Q0aSRNyB8VE0tAlMN84cgjBFVa57vDTIFJAbF5FEohL88uevaYhx
	 Ah5YHdWpyJUvKPInLel3dWbO4I8pB/zPKjVpzp5q5qqjwXluKqI6ab8ybWMXs+0xIWq5P
	 7v555N6SKbUXKNnuT5TxOMJbUQ4MXmFpg/DQxSUKiF4ZBrCuf9Lr3MlMuIpeIZ3h66Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oX0dtz0s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CC5606A31F
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 22:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53CC5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oX0dtz0s
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0db268bd8so23383367b3.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 15:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793054919; cv=none;
        d=google.com; s=arc-20260327;
        b=JDE+hDHiHE1la01oWhew8gua6aEZhFnUcUSq3tx8Kr9gBx/ZtCXAjiM0qOW+2H9UQf
         jQ5dWJ8WhTcnkwRZ5CXJ6Geg7sq0oK5TNulDa9Sar2Bi5jbR2miBZyYMi8Ao19bOYIPk
         frdZ42OScagqf11X/+8SFGXcjQ094nqUNlmD09zzRwrwC9NENz/hHPOv0yGhNhX1cgtO
         sArHdTT5wUT3f//+jm9WoGqpvNlCFY07sET2pDJDYMBUCZCFe6lgNo5MGxY2PCjGuyHB
         iVuyVGdr5DpfCFJSmLv6jzJasaZ2n1Ko4sJnTQFWHmV3cLQcrbfQe7wiCh/QXIaxCzYD
         t7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mshdBP7zWJ8tsttLUx6xhnibBdLHVDUK/dBlFucrT6E=;
        fh=8C0Lm4TMaVbKv0r+2pEeIA4v35hviqcOmjoKQSS2WNA=;
        b=ku9OI+k8Ym4BPoRtwFFPtURrcfbyboOHuMzW0F+Vi4lmBNx/zr9FiIoh8rb6I2fD4G
         rrvVZgI47R7AAHY8gYJgPdfnSbg5Qm5xqeqIfNZRO2SMep4AQNHS8t3jwZJehcQFNJqg
         Lb2xnnMzYcKgQ/riGQoMet8A6tnp7rO3pDWv2Hs72OP8Mtd70S2GINKS5/GFpiLOaTP7
         6T50RfT/O0UQ62PgRcb0CdeG8KZ1AhiTg1/d2IS1H75rM9ZMDDE1bcqflgpnMnpApOKZ
         5TCPvqOk1ePwA/k8kfTQgZkUuRmJBghZHpHgRfhMhLqLJOLUZBhScABlxK6WxP3jxbNQ
         ygNQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793054919; x=1793659719; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mshdBP7zWJ8tsttLUx6xhnibBdLHVDUK/dBlFucrT6E=;
        b=oX0dtz0s3GyJ7c7WnGs1mYpZ9gvzuDE6ApNczxHDE9Q1D4fFS+By7BbUOmyop+8D9Z
         g5p/oPLAfPomDyicTg9AZlIS0OPwpUppFP/1l/ZFaj2rF6PiHkzcf8ZyJ5DYZ3LH2ETr
         56Ti2ZXntKheQe6OxSDb4mIpdsHlv+UcBfiLYEfOFCD1dr3Pi9YuN4g1c5GO+ydUdqk/
         XBqoVXI4B2sp3VkKQq1Fx3T/24HoXmbD7oxkbHHPo4+L18nU8sTzB5TLmYHIzS1RQEDU
         OJ0/gYG1cbkmQNI0TcHD3Kzlivj4vAgiTxdzfExj1F990k8jEouatXKeuZdWpsdIOQbq
         M2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793054919; x=1793659719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mshdBP7zWJ8tsttLUx6xhnibBdLHVDUK/dBlFucrT6E=;
        b=dE3VLt5ONsAWv4hmlNk8w7SkBMJqFkeK+HjU5sGQ1m1EVEb9QuKdItKtCMt9wFzd+I
         nzqent4yA++Qg+/RudE1OFetsXOe1NXQ/3IW2bwaJJycAAIiIHQnxTxZ/P76JRHAYZ/g
         tWPD4w94k5acNwsa36hwzEAWXu7eeUnD3xbcsqHl6yvvC3ixSpWiUecVe/EHS1uIx/ru
         mCD38kFyH9AvsVSxzMkLwWMXNQTLoC4NPFRugF4QhvVBkWkAXsTzqMlncroU9ncpdeyL
         xt/3Aj/TUAdWmr0xeFTNd8FeGg8bE1rPmjVUYggIMg86dy6qbFnvs8/Z16sA/wwtrB31
         f86Q==
X-Gm-Message-State: AFq9FYIhynVhEuQSodEHt6t+kErsNM6s9yxpxm8vBhnI+lvSXenjeefq
	CD7o9034AHBEE3ljn+vyIY56IyAQn3xxCI34OTQTxZiKabSwm+Wiq46oxAXBt7R0KzAKYS/jIT3
	cGIaV0bTFZJmqbBjMwHO1gXs4hcnl5gT3cUk1UXI=
X-Gm-Gg: AYBFou2Utg0eGe8gYvXYZDJzitoMQEk+TAPH8akvk75VltkDl5TnBWHLeRV04ShXn0s
	lE+fW1rC13AbdaYeRbiH8ZDRhUt/YpNRp8f0Vo8KGAo1h50xJm1nb95NUceeaiPykA/ybXmJF4k
	kPnaEcopc9s/487g3ylAkKSeTW9Z4IfF65d5UUD523bxxlLZuvpnjMEanRGA1Jv5/LmdBgjHLzY
	vAu24U1QWf6Z9cTxmGchRkyiMBMl9m8pTM/LQ+t5dA1wnD26sDEloBrscRJGu7jKNB6bbRbIl0C
	ZaLzQC3YB9NqB2Kmn95b/8xbzeUfLxpaOKpY2+yFzM1ohQabDjabD1F7WnfnRAMlJ3/vJ7h7lSZ
	auWSMZcBtAz5fCMkcUO4l+8m8fhqIgSwF0Jv/6BaYIWS5kCiOq13IYAEHTq06JquPyzD/5nBST5
	UOsiB47gr6wR+HrGQ=
X-Received: by 2002:a53:ad85:0:b0:672:ef39:5fc6 with SMTP id
 956f58d0204a3-67a454900ffmr2904378d50.147.1793054919173; Mon, 26 Oct 2026
 15:48:39 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261012-dd-cmap-part2-clean-v12-0-3c8cc5725def@gmail.com>
 <20261012-dd-cmap-part2-clean-v12-26-3c8cc5725def@gmail.com> <sashiko-outbox-170725@kernel.org>
In-Reply-To: <sashiko-outbox-170725@kernel.org>
From: jim.cromie@gmail.com
Date: Mon, 26 Oct 2026 16:48:13 -0600
X-Gm-Features: AclHuK_U9GeBl7u0-5vmIpwTNJsdz2Sn-v3e-HGd_0bRIhFESQNIVxLVo-t00Ow
Message-ID: <CAJfuBxxZ=znaXKhz6w3tT-qq-AKPQHWwzWr53w98k2wDAh3Ytw@mail.gmail.com>
Subject: Re: [PATCH v12 26/40] dyndbg-test: add do_bulk testpoint, rename
 do_prints to do_classes
To: sashiko-reviews@lists.linux.dev
Cc: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@net.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:37=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Low] test_dynamic_debug: classmap offset mismatch for submodule classe=
s
> - [Low] locking: param_set_do_repeats blocks param_lock for up to 60s
> --
>
> commit adf504f365302c7db4e37850cebef69f82ed353f
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> dyndbg-test: add do_bulk testpoint, rename do_prints to do_classes
>
> This patch renames do_prints to do_classes to better align with its purpo=
se
> and introduces do_bulk to generate high-volume workloads. It adds support=
 for
> executing these debug operations multiple times or over a timed duration =
using
> shared module parameter callbacks.
>
> > diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
> > index 01ce07001d4c7..19e27b5747ac2 100644
> > --- a/lib/test_dynamic_debug.c
> > +++ b/lib/test_dynamic_debug.c
>
> [ ... ]
>
> > @@ -28,25 +28,57 @@
> >  #endif
> >
> >  #include <linux/module.h>
> > +#include <linux/sched.h>
> > +#include <linux/sched/signal.h>
> > +#include <linux/jiffies.h>
> >
> > -/* re-gen output by reading or writing sysfs node: do_prints */
> > +#define TEST_MAX_REPEATS 10000
> > +#define TEST_MAX_SECONDS 60
> >
> > -static void do_prints(void); /* device under test */
> > -static int param_set_do_prints(const char *instr, const struct kernel_=
param *kp)
> > +/* re-trigger debug output by reading or writing sysfs nodes: do_class=
es or do_bulk */
> > +static void do_classes(int); /* device under test */
> > +static void do_bulk(int);    /* device under test */
> > +
> > +static int param_set_do_repeats(const char *instr, const struct kernel=
_param *kp)
> >  {
> > -     do_prints();
> > +     int rc, ct;
> > +     void (*repeat_fn)(int) =3D kp->arg;
> > +
> > +     rc =3D kstrtoint(instr, 0, &ct);
> > +     if (rc) {
> > +             pr_err("expecting numeric input, using 1 instead\n");
> > +             ct =3D 1;
> > +     }
> > +     if (ct > TEST_MAX_REPEATS) {
> > +             pr_warn("%s: clamping %d to %d\n", kp->name, ct, TEST_MAX=
_REPEATS);
> > +             ct =3D TEST_MAX_REPEATS;
> > +     } else if (ct < -TEST_MAX_SECONDS) {
> > +             pr_warn("%s: clamping %d seconds to -%d\n",
> > +                     kp->name, ct, TEST_MAX_SECONDS);
> > +             ct =3D -TEST_MAX_SECONDS;
> > +     }
> > +
> > +     repeat_fn(ct);
>
> [Severity: Low]
> Does this synchronous loop execution block param_lock system-wide?
>
> When test_dynamic_debug is built-in, writing to its module parameters via
> sysfs triggers param_attr_store() in kernel/params.c, which acquires the
> global param_lock mutex around the .set callback:
>
> kernel/params.c:param_attr_store() {
>     ...
>     kernel_param_lock(mk->mod);
>     if (param_check_unsafe(attribute->param))
>         err =3D attribute->param->ops->set(buf, attribute->param);
>     ...
> }
>
> Because param_set_do_repeats() invokes the workload synchronously (which
> can run for up to 60 seconds as shown in do_classes() below), this starve=
s
> param_lock, preventing other processes from reading or writing any
> built-in module parameters for the duration.


    In standard usage, test_dynamic_debug is built as a module
(CONFIG_TEST_DYNAMIC_DEBUG=3Dm).
    Under kernel/params.c:KPARAM_MUTEX(mod), modular parameters
acquire the module's
    private &(mod)->param_lock rather than the global param_lock. The
lock-hold is
    strictly local to test_dynamic_debug's own sysfs nodes and has
zero impact on
    core kernel or other module parameters.

    Even in the hypothetical built-in case
(CONFIG_TEST_DYNAMIC_DEBUG=3Dy in a test
    kernel, which I would consider mis-configured),
    test_dynamic_debug is exclusively a test harness whose workloads are
    triggered on demand by explicit sysfs writes. The loops call
cond_resched() and
    check signal_pending(current) on every iteration, keeping the execution
    cooperative and immediately abortable via SIGINT.




>
> > +
> >       return 0;
> >  }
>
> [ ... ]
>
> > @@ -103,7 +135,10 @@ enum cat_disjoint_bits {
> >       D2_DRMRES };
> >
> >  /* numeric verbosity, V2 > V1 related.  V1 is > D2_DRMRES */
> > -enum cat_level_num { V1 =3D 16, V2, V3, V4, V5, V6, V7 };
> > +enum cat_level_num { V1 =3D 16, V2, V3, V4, V5, V6, V7, V8 };
> > +
> > +/* test _USE_ w offset */
> > +enum cat_level_offset { Vu1 =3D V1 + 8, Vu2, Vu3, Vu4, Vu5, Vu6, Vu7, =
Vu8 };
> >
> >  /* recapitulate DRM's multi-classmap setup */
> >  #if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
>
> [ ... ]
>
> > @@ -160,6 +183,19 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_emptyclass, 0, =
0 /* ,empty */);
> >  DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_maptype, 3, 10, "no such type");
> >  DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_len, 0, 60,
> >                             "base", "plus", "classes", "length", "too-b=
ig");
> > +#endif
> > +
> > +#else /* TEST_DYNAMIC_DEBUG_SUBMOD */
> > +
> > +/*
> > + * in submod/drm-drivers, use the classmaps defined in top/parent
> > + * module above.
> > + */
> > +
> > +DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
> > +DYNAMIC_DEBUG_CLASSMAP_USE_(map_level_num, 7);
>
> [Severity: Low]
> Is this registration macro passing an outdated offset?
>

yes - fixed in v13 (forthcoming)

> The patch adds V8 to map_level_num, increasing its length to 8. While
> cat_level_offset correctly shifts the submodule's class definitions by 8
> (Vu1 =3D V1 + 8) above, this registration macro still tells dyndbg the
> classes start at offset 7.
>
> This mismatch causes submodule debug callsites to map to the wrong class
> IDs, leaving the last class (Vu8) completely out of bounds and
> uncontrollable.
>
> > +
> > +#if defined(DD_MACRO_ARGCHECK)
> >  DYNAMIC_DEBUG_CLASSMAP_USE_(fail_offset_big, 100);
> >  #endif /* DD_MACRO_ARGCHECK */
>
> [ ... ]
>
> > @@ -210,20 +247,85 @@ static void do_levels(void)
>
> [ ... ]
>
> > -static void do_prints(void)
> > +static void do_classes(int ct)
> > +{
> > +     if (ct < 0) {
> > +             unsigned long timeout =3D jiffies + (-ct) * HZ;
> > +
> > +             pr_debug("%s for %d seconds:\n", __func__, -ct);
> > +             while (time_before(jiffies, timeout)) {
> > +                     if (signal_pending(current))
> > +                             break;
> > +                     do_cats();
> > +                     do_levels();
> > +                     cond_resched();
> > +             }
> > +             return;
> > +     }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-dd-cmap-=
part2-clean-v12-0-3c8cc5725def@gmail.com?part=3D26
