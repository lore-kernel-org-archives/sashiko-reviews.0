Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602334;
	b=wOzwsSfT/I7h1SNe1smxh5VOiD65GjqZoZKa6MyCZ0TqZj65arnfgX5jNCiuDvge4xod
	 AbmFG2eh1pb39+6wiVG3A160ffGapEfKt4JYrSvNM16QL55u1z5amMFX5jCrBOtEyEdEE
	 G5CJYwANorSCzRwMkAh/CmUi1GHBV0zGF5HHwMo8qD5ncFZYqBFqvLomnUsIeiHdiZsAz
	 ao9u8umYxF3f1/BSJjG3BdrCacRuQ0RTyNdYVO6fLFRe0Q02f1wJNf6ZyUHq9+WkTIOZ1
	 BQAhr4CJrpwe4Xdc7e89l56MieHojCKrstBBzmVSKGckD1T33fYKT4n/2bJPNE4STpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602334;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:User-Agent:
	 MIME-Version:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Transfer-Encoding;
	bh=3sFSIY7zk3iPL6qFeV9u9740fEYkNs58q+BGNdovxmU=;
	b=C2/+2VSHkXhFahxaaqLhI999Tgs4VbKEX60ovzgaA1CxTxWv0BoK9yTWSiMlUUW82LJI
	 bI34xGZB7ElLeir8E/hVJGfZ1pusv/ihraioRg4bgLc/EjFnr7kA14CrR19jRLK2Fc2pF
	 higG9uRv/cFKIb/0Oo22CxvuML2lQPG4pdn0gGjeaH/FFtbctdItJGqmD24hZLL1cugUW
	 b6kJMNIMSHvk0exwa2/IzqU8ajjvhmDosvp+k6wWgZWluMD4fZ8dUAcJvZoewsBz/t5Xc
	 yYmEbQBrdNXX6jGwY4aLtU7+jSh4IjNvj1wF3zO9IGyciWlRNvoA6NtlLHqkXH16ibQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SRC8yc62;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7273E606A333
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 20:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7273E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SRC8yc62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794602332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3sFSIY7zk3iPL6qFeV9u9740fEYkNs58q+BGNdovxmU=;
	b=SRC8yc62JrvZHits+xd3+nqTN9IXDZ/8uY7AutEvArJoFfi404EGKq3x7b56o+zoh8de/u
	HzptctvLcKn0u6zP8DSqhsOo/70C7CipRjKw0Qkh+Og0QsNctKIMkwTtOdwFAaxH/fKe6K
	HbZ5XGwmifLNpcqLw/R61VwdhzAtOBE=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-8VcLDanOP0CF7NpZFmh31A-1; Fri, 13 Nov 2026 15:38:50 -0500
X-MC-Unique: 8VcLDanOP0CF7NpZFmh31A-1
X-Mimecast-MFC-AGG-ID: 8VcLDanOP0CF7NpZFmh31A_1794602330
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-82315dbce25so859299a34.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 12:38:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602330; x=1795207130;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4tpO5biOpGgL10yOplA7RI/2o5T3LjwiEUChVIujqhc=;
        b=I0ro4UrYYLcPnfKstEn0Gf7kdEdqJ1pFc5Go2YorydcJQ6FYIxm8WdI8VgyUD8FF7C
         5EoDdnB88loU4GuSikeQIdgsbaN7YaQS9njlkuBEoF2EDrhEsYYMSRTvL4IEctHTkPke
         f24B67qcP+8I4cHV+9+a2xl0jocI31e7oasPnCjE//9LyfqJgD2IkirptZZJwBwNOmcX
         /wxssLrIozRDrr6rqKoXr0hEjpctltk/3P1/BCbczYdUEX+88wVpLpdImmtISn4zappi
         tz0S0Yi4nP5yW4lrYbTOo2AdkkLlz6IPCuYcCu9tktfqodxWUxhYudAZkSBCoJFzfBK9
         eHew==
X-Gm-Message-State: APuU4Z96jOVZlzepz65gxDWYF3xOTI5j4g2NDWqzKw+ySMfBdQdXQ2qx
	gAtGM5oJQlsq7jW6AyghsxJUZazq9sdBVlb/VqwT7zSxNR81iJ0uppG1Xgn3S+nR3ZAw0YXlWkq
	gZuoc/rpTO5dI3sxrBmZFRXp7/bK3JPoFj7BsSBHBH1Lgu/bmLYu1cYXgt077sD6pqh8BzYngMZ
	LlGX2YH2xEJiVXftM7qop/xnKdTOaryqjiZlZSimW46G9pPUBuRus=
X-Gm-Gg: AYBFou3Ckmr/FmixuFBUAMhzRN8//WyewFaABLDV4cSjtsttuDAAxOBolxFt5yyyr3W
	VkwjmBMbCxbqQMkc68oot6CB7dF2aoKWXImUkXkYDiHw24NVfHRS/Quzxpz0Ha0wxN4HJ6Iqh3S
	znfmDVra5VstdkGXYHvXXW0xvnuf4wz3dzB3SKoX3aXz4uFn7ktKgTej/Iwe+EcNNRmvsk3zcaD
	G5zG4+XmM1fPht4mmekPNXtdGlFEwdn7C5IWfxtKe/yIIy6l7R7ttsNuGivk0QxtFFZAHJ8YH6t
	bJDkBHPMMwM/d2LKxtqfoh2Hy8lAExqd4feOr8EFiNENQfecCxss5UEQibiviyO8tYdsYwFNgMZ
	vgC26cbVDeGiwlhNRFaf8sKnu5BhNAo/g2FnjkgZXWzGpa4IZv6Q/5Pi/aV7ei8sR7vkkbt8l6u
	qTtPtkv4oSH9mAsTOhrJaJGtLgIFA1
X-Received: by 2002:a05:6808:1816:b0:53a:8c5:d7d7 with SMTP id 5614622812f47-56e6626d27cmr2968950b6e.58.1794602330051;
        Fri, 13 Nov 2026 12:38:50 -0800 (PST)
X-Received: by 2002:a05:6808:1816:b0:53a:8c5:d7d7 with SMTP id 5614622812f47-56e6626d27cmr2968927b6e.58.1794602329547;
        Fri, 13 Nov 2026 12:38:49 -0800 (PST)
Received: from crwood-thinkpadp16vgen1.minnmso.csb (71-34-16-191.mpls.qwest.net. [71.34.16.191])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7024673csm2970739b6e.8.2026.11.13.12.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:38:48 -0800 (PST)
Message-ID: <8e121bf5d3e3dc1d0afe7dcc18f6feb68fae9ee8.camel@redhat.com>
Subject: Re: [PATCH v7 06/10] tracing/osnoise: Reset cleanup
From: Crystal Wood <crwood@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Date: Fri, 13 Nov 2026 14:38:48 -0600
In-Reply-To: <sashiko-outbox-212339@kernel.org>
References: <20261113064103.3041704-1-crwood@redhat.com>
	 <20261113064103.3041704-7-crwood@redhat.com>
	 <sashiko-outbox-212339@kernel.org>
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cNo6OpRbUYr4c23IbCz5O0r5G902p5pwWUK5Gen_zk0_1794602330
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-11-13 at 07:20 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] tracing/osnoise: CPU hotplug race in timerlat_fd_open() leaves
>   stale fdd
> --
>=20
> commit 25ee38a6983ff50cb9227e203eed4ba8758cefa4
> Author: Crystal Wood <crwood@redhat.com>
>=20
> tracing/osnoise: Reset cleanup
>=20
> This commit reorganizes per-CPU and global state resets in the osnoise an=
d
> timerlat tracers when stopping kthreads, detaching file descriptors, or
> restarting the tracer.
>=20
> > diff --git a/kernel/trace/trace_osnoise.c b/kernel/trace/trace_osnoise.=
c
> > index e61f57230eefb..8db0697b69e4a 100644
> > --- a/kernel/trace/trace_osnoise.c
> > +++ b/kernel/trace/trace_osnoise.c
> [ ... ]
> > @@ -408,6 +380,39 @@ static struct osnoise_data {
> >  #endif
> >  };
> > =20
> > +static inline void osn_reset_cpu(int cpu)
> > +{
> > +=09struct osnoise_variables *osn =3D cpu_osn_var(cpu);
> > +
> > +=09WARN_ON_ONCE(osn->kthread);
> > +=09WARN_ON_ONCE(osn->fdd);
> > +
> > +=09osn->sampling =3D false;
> > +=09osn->pid =3D 0;
> > +=09tlat_reset_cpu(cpu);
> > +}
> > +
> > +/*
> > + * osn_var_reset - Reset non-per-cpu state, and check for stale data
> > + */
> > +static inline void osn_var_reset(void)
> > +{
> > +=09struct osnoise_variables *osn;
> > +=09int cpu;
> > +
> > +=09for_each_possible_cpu(cpu) {
> > +=09=09osn =3D cpu_osn_var(cpu);
> > +
> > +=09=09WARN_ON_ONCE(osn->kthread);
> > +=09=09WARN_ON_ONCE(osn->fdd);
> > +=09=09WARN_ON_ONCE(osn->sampling);
> > +=09=09memset(&osn->zero, 0, sizeof(osn->zero));
> > +=09}
> > +
> > +=09tlat_var_reset();
> > +=09osnoise_data.tainted =3D false;
> > +}
>=20
> [Severity: Low]
> Can osn_var_reset() hit WARN_ON_ONCE(osn->fdd) if timerlat_fd_open() race=
s
> with CPU hotplug takedown?
>=20
> timerlat_fd_open() disables migration without holding cpus_read_lock() or
> checking whether the CPU is still active under osn_var->lock.  If a task
> pinned to CPU0 enters timerlat_fd_open() just as CPU0 is being offlined,
> balance_push() skips the task while migration is disabled, allowing
> osnoise_cpu_die() to run before timerlat_fd_open() attaches osn_var->fdd:

True, but not a new problem other than that we have a new way of
detecting it.  I can send a followup patch once I return (I'll be away
for the next three weeks).


-Crystal

