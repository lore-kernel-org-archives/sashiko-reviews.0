Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E72472539
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 22:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787783686; cv=none; b=CDlLtFE/i4Q6Ldk19IgNq1V729eBrV2fafUOv0jFgogFAOGgQHMHPinTpqrYJ9y0zdwSURtGO9MOVqnTubQJ7t1lbdsqZUHDdtUraNEKCAXiahc81nw2c31CxdH1w0a6Ky3jIE6QysDbcFNoGqWN5wwE475oQE3a8juI3qBTu6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787783686; c=relaxed/simple;
	bh=5zGWCTCCgh+me50aGH2mP1+xXWb7dBkCxCGloKUkED8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TuA0ieO2RJhQ8G/CUUPxEFjlRivapagOF6WqsK4C8+gbc6GA5MMOMX3tsbU63nBnMkir7CJKPbUsV58PR2vEjn9/4wpDktHKVVQT9R76t2kWbapNoqJkVTFBipoqh8WiWdmempSgcZhkj4l/zF73TLSv+WzyK2k/XdYovrIXpZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cGGhB2re; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cGGhB2re"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787783684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w5zw+6Up3MKTfl5/pZt/c23dDH6Zq8S7zwIXI2sJqug=;
	b=cGGhB2rejjFsnRnRFb7u289gEamLgYAW3zjRZbMt/qo4RoEnLvFtFiLdvkGAnsZxWPm+vF
	cegGLYfkUfpvNIvipLXBn/h//n/bYlYwmNIPiBuA4fDTKpOy20QmSbdpB+EVtpqoVWAIim
	6Vkeg9UfMqni/umL8xyk+1L7pe07kSo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-qnLvfA9dPxCPDqcUe9L0sA-1; Wed, 26 Aug 2026 18:34:43 -0400
X-MC-Unique: qnLvfA9dPxCPDqcUe9L0sA-1
X-Mimecast-MFC-AGG-ID: qnLvfA9dPxCPDqcUe9L0sA_1787783682
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d137a68so27402181cf.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 15:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787783682; x=1788388482;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CvHY7+eWnolzFFlzBRxoPWXxs3mUvthAAfNzMwy99DQ=;
        b=nLMgJE18IV0Sh3ELxOtvV8Y0hxA1afr9RQd17lCsVp906JTPbp6Da8P39KQCQbwjLZ
         dOQ9+H4SWdRDBiDbModMNzxKIGxz+hVsedel+Xuv9l4gSOdSK8tgc9lz0InnJZsjp6vq
         swH+evnVeAF1Ji7Bg2/HGBQtJtKxyn8c9V+LpOtskODmeAL6hNSNO5tIoFLs44Jm9d3/
         9kOxnyEUSR5wRdcdnfNHb6fjKjw0aLX50xcQfRmXoQQ68KwTiYSF6TEZPbJdfr/lPjfz
         R0fe+hY7tq9bvRpm5yg90dqtjkkn0l8ZeWSC8Iw1yd1XcoSquAI/c14qQVSeE7UWjBFC
         iLUQ==
X-Gm-Message-State: AFuF++l6ll07Muku0K9UsIsX/VwqQTBFknSfaH/c4mQ1tQ0OfkxUbfaH
	PUxkgjm5Om7UONramB03XDq6PHf7AgDvvsrMnFL9vrPMy+xyU2Zdg44zD9vvPoCmeFlVkBfWUqa
	7GqWa7kEuofDaGNyQLPPyZT3/QZzJsZahdFJfe6IlT8RICzC0Ws+VlM1FAMr0ets6hUD0lTDwfK
	P45OjpwKrqwglZBQ5rM3umkFNpyodj72nfnzt5GM3845zpyhqdAD8=
X-Gm-Gg: AR+sD1107BJ9MfDRch0rd1zLb6zMulcbsBqOKKLO7JNQ5K3e/25I+3c6MQMqSxz6vJE
	NRzz5r7uoUKwjCxR1S9lDbZYnRWVpG0c6+a5wyBnFk42xJKmgnHuDU71G9N/7MGy8golHrT/fuD
	+XC8ZPfG341BriQflDTy0FU9LnNN+kWZKdOHFiF2Nq0YBW7alOvNXXQIqG3aHaoj5Rrpzg4V2sp
	z2D7zzhFXEfFAZ7E87WoEW2zu0KFLS8uQ/WpXZM8BupLKvl986P5lLlBo+vMy28ccZVMP6WuI/G
	qfyNUl9kTNVIPXgqXJMClclMfGUlZlNVs8WNIZc/PNP1U78DN9lmabFMauyGMCn66TFfUNqL9Ux
	yLCvKhNNSXUcIjeIsD0bMWAG/YZfGMfYN
X-Received: by 2002:a05:622a:1b26:b0:51c:103:fb56 with SMTP id d75a77b69052e-52e4231d9f8mr119320691cf.15.1787783682413;
        Wed, 26 Aug 2026 15:34:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1b26:b0:51c:103:fb56 with SMTP id d75a77b69052e-52e4231d9f8mr119320121cf.15.1787783681741;
        Wed, 26 Aug 2026 15:34:41 -0700 (PDT)
Received: from crwood-thinkpadp16vgen1.minnmso.csb ([2601:447:cc01:6890:c623:cd89:345e:99f3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fa1a557d6sm6949421cf.12.2026.08.26.15.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 15:34:40 -0700 (PDT)
Message-ID: <56a2ecf7ae25f96b6bc68da27402467f04ef2b99.camel@redhat.com>
Subject: Re: [PATCH 1/4] tracing/osnoise: Per-cpu mutex and fd detachment
From: Crystal Wood <crwood@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Date: Wed, 26 Aug 2026 17:34:39 -0500
In-Reply-To: <20260824213037.F41B11F000E9@smtp.kernel.org>
References: <20260824211544.3984835-1-crwood@redhat.com>
	 <20260824211544.3984835-2-crwood@redhat.com>
	 <20260824213037.F41B11F000E9@smtp.kernel.org>
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 70FSv8I0T2NP8x9ceiLMi1gHn5SVFs-hpRNz1ukPv80_1787783682
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-08-24 at 21:30 +0000, sashiko-bot@kernel.org wrote:
> > @@ -2086,15 +2100,9 @@ static int start_per_cpu_kthreads(void)
> >  =09 */
> >  =09cpumask_and(current_mask, cpu_online_mask, &osnoise_cpumask);
> > =20
> > -=09for_each_possible_cpu(cpu) {
> > -=09=09if (cpumask_test_and_clear_cpu(cpu, &kthread_cpumask)) {
> > -=09=09=09struct task_struct *kthread;
> > -
> > -=09=09=09kthread =3D xchg_relaxed(&(per_cpu(per_cpu_osnoise_var, cpu).=
kthread), NULL);
> > -=09=09=09if (!WARN_ON(!kthread))
> > -=09=09=09=09kthread_stop(kthread);
> > -=09=09}
> > -=09}
> > +=09for_each_possible_cpu(cpu)
> > +=09=09if (cpumask_test_and_clear_cpu(cpu, &kthread_cpumask))
> > +=09=09=09stop_kthread(cpu);
>=20
> [Severity: Medium]
> Will this always trigger the WARN_ON() inside stop_kthread()?
>=20
> Here in start_per_cpu_kthreads(), the kthread_cpumask bit is cleared prio=
r
> to calling stop_kthread(cpu).=20
>=20
> But in stop_kthread(cpu) introduced above, it expects the bit to still be
> set and asserts:
> WARN_ON(!cpumask_test_and_clear_cpu(cpu, &kthread_cpumask));
>=20
> Since the caller already cleared the bit, won't this result in a guarante=
ed
> warning stack trace whenever this recovery path is executed?

This should just be replaced by a warning, as we shouldn't be able to get
here with an active kthread.  All callers of kthread_start() and
start_per_cpu_kthreads() are under trace_types_lock.  All callers of the
latter stop all threads under the same lock.before restarting them --
except osnoise_workload_start(), which still holds the lock from when
the isntance was first initialized.

> > @@ -2528,6 +2577,13 @@ timerlat_fd_read(struct file *file, char __user =
*ubuf, size_t count,
> > =20
> >  =09osn_var =3D this_cpu_osn_var();
> > =20
> > +=09/* In normal usage, this should always be uncontended. */
> > +=09mutex_lock(&osn_var->lock);
> > +=09if (fdd !=3D osn_var->fdd || current !=3D fdd->thread) {
> > +=09=09ret =3D -EINVAL;
> > +=09=09goto out;
> > +=09}
> > +
> >  =09/*
> >  =09 * The timerlat in user-space runs in a different order:
> >  =09 * the read() starts from the execution of the previous occurrence,
> > @@ -2574,6 +2630,11 @@ timerlat_fd_read(struct file *file, char __user =
*ubuf, size_t count,
> >  =09/* wait for the next period */
> >  =09wait_next_period(tlat);
> > =20
> > +=09if (fdd !=3D osn_var->fdd) {
> > +=09=09ret =3D -EINVAL;
> > +=09=09goto out;
> > +=09}
>=20
> [Severity: High]
> Is it safe to hold osn_var->lock across a sleep in TASK_INTERRUPTIBLE?
>=20
> The function acquires osn_var->lock and then calls wait_next_period(),
> which sets the task state to TASK_INTERRUPTIBLE and calls schedule().
>=20
> If a user task calling read() is suspended (e.g., via SIGSTOP), it could
> remain in TASK_STOPPED and sleep indefinitely while holding the mutex.
> This would permanently block any administrator actions like CPU hotplug
> or stopping the tracer, since stop_kthread() attempts to acquire this sam=
e
> lock.

That's not how signals work.

> [ ... ]
>=20
> > @@ -3157,10 +3203,13 @@ __init static int init_timerlat_tracer(void)
> > =20
> >  __init static int init_osnoise_tracer(void)
> >  {
> > -=09int ret;
> > +=09int ret, cpu;
> > =20
> >  =09mutex_init(&interface_lock);
> > =20
> > +=09for_each_online_cpu(cpu)
> > +=09=09mutex_init(&cpu_osn_var(cpu)->lock);
>=20
> [Severity: High]
> Does this skip possible CPUs that are offline during initialization?
>=20
> If a CPU is offline at boot time, its mutex won't be initialized here.
> Later, if an administrator hotplugs this CPU, osnoise_cpu_init() will
> schedule a workqueue to invoke start_kthread() on the newly online CPU.
> start_kthread() will immediately attempt to acquire the uninitialized loc=
k,
> leading to a system crash or lockdep splat.
>=20
> Should this use for_each_possible_cpu(cpu) instead to ensure all CPUs
> have their mutex properly initialized for hotplug?

Yes, will fix.  We should probably do the same in osn_var_reset() and
tlat_var_reset().

-Crystal

