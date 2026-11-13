Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601401;
	b=ZSHUKbYNPFq0PmqGWX9gRxiRCEcJg5a3UqVncgLcJDFBZ1etzMMr3AQn1it24OSfPuy4
	 SJ+TrK5fV2K5840BwPI2qejkKZVAhK1uK92QF+906H9NkL8M9bEyTW4RcZfxChblkdfhe
	 3dpGcrzQdNuCgWVJPVSiaf6p95lOygyjABgvsFGv9oz8B/y614RTEPo7N3SCs6Xa/HRht
	 eKgd1574F8TJj5gkBKcRUn3MEwIiBp20XishoE46HsikLBwtXXspRHK8gtQ0hqQVrcdg6
	 uKdaa6eFclS+PBbRvcKxmol48orVnbZpqE7gkt5/nvPsZRkLuIpQsma46bbstcBz62w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601401;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:User-Agent:
	 MIME-Version:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Transfer-Encoding;
	bh=OmgP7lpAhGw+ltLrjN+pc1MVDZJ3Kku9R5PxK3eTW1c=;
	b=lxO28WQapmiLtYqa9aFCguoEaqZRnB7lQiysmQ/3k4pYekSnXWbpIKzo7VN0yS8SmPtc
	 /gSRYhS9/A9TWxA+8H6Tlv0mDw2zMI0ESHEYbfEwVMsYhoo2wZ99ozf8lgdIrb+QvKWnH
	 xPi3XfpgM452iQMY+gHtImZ8iXerlKRJHAKu2ARa9ZJIjK4hBdfLSYO46kyPNzwNl4yRh
	 Coffqpdj08x4D6KEOiPgil3JbjCz6P7FHMWPOiL6r/XObEzEkXmWQYEDZcPiG8dFn338g
	 LlA0UEPxgimYW0pAJBW2kIwPNLhPgg+1LZmnDivFCPYZ/F253xc3ZSaUg/9ijfMosRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g6fFGq2j;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC375606A335
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 20:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC375606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g6fFGq2j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794601399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OmgP7lpAhGw+ltLrjN+pc1MVDZJ3Kku9R5PxK3eTW1c=;
	b=g6fFGq2jz9SCICkNVp8Ec6JZh5qqXa6iqPCN/AAVdPEs4lcMyHnpVKU/7HlOyrXfU0tmnr
	D3asAoGyUO1xWzT6AhscZcEBm1hWaRfB53n77kWxxPmK8a4qmw9U7Okm3XoPX5eYwdYaCs
	AEn8SWKudYAcn+xG+sxfMqp2mrD7/7A=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-DvmElM77NpqYCmEER_xAhQ-1; Fri, 13 Nov 2026 15:23:18 -0500
X-MC-Unique: DvmElM77NpqYCmEER_xAhQ-1
X-Mimecast-MFC-AGG-ID: DvmElM77NpqYCmEER_xAhQ_1794601397
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-45a07949855so1823033fac.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 12:23:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601397; x=1795206197;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OmgP7lpAhGw+ltLrjN+pc1MVDZJ3Kku9R5PxK3eTW1c=;
        b=jsq8yv002dksZ8D21fynb65RKFR0bH6GsmXRY0ZH1GxqC2KuyCltJTLYX8y1GkdfGu
         cztrxzGWE92IKBzwv8/4UvL2xTcXWsb4dUDnjP9itRa/R9UJKhNFw7Sa2MWTThsEUy+k
         oY7lhuxISF9TG+MXnWTbHdo6V1730vWJklTwdQ+C74xMfecsqeRHjNGL5UiQ3cvhF3ut
         h51SOxv8w9LuTTxFosS3cP7MlHfa63TkqycBs7kXH28W+S45Fvkbsxrw+G8Q8QGCm4+C
         EvAJfhcdFpXWVfzKG8H2+D3EAQFJwsWyAiIeyuMH1eCqKoHmP65DYBtFHRXFPxRVaUCQ
         kAwg==
X-Gm-Message-State: APuU4Z9gtIxuSG+nSR6uYarRASvnEtzbxWaQv+cI30Vai7rSZEsY9Vx9
	hKqeigA5cWnsVM6nBY2JEv+xyvfU3INeFjx8YfAF3/4LEX+/pD+3NDPJqfH68z3ugsR4F/piLK7
	H/H7sugwRiyMC+fdMN/3KU+hlnecYMjFFMG7E0cxokSoRYt2pwS7s37K/H38Zya+plwSjFelYRD
	tPnFGW86FmcIyM2dNnczIpFAuorvr+R4GLqgsmoR8puapA4lkp2zI=
X-Gm-Gg: AYBFou0BTUKsePv8o+8cyHZmFx1JbXB3tw1pahrzWF5MfShaJMwizNGXsWvg6C/seeo
	720gYhBGqV41DXyvC0IZuH0GkZ6e8uQmPBQROPwI5WyLoWRF2npZEwsnRxpBd7afmL5f+7SSS6I
	NxJGJhwRSh5A+8H++gp9OYCRWxwIL9JfeMsPVAniM0FCqG9LrZD/m2r29yohtIQJYXbg1rDXwm3
	3KKlK8XgGUOPqkDVZyeBCjZj8AtF0WJxYTlB/ctPIcWxY/MjdLiW0Wit+hOpVE3uiSmrZyXc/AP
	QN+RECDBP9g4wTbkc7VTewuXniCfCfizQka+EwIsAcKJoZRTE1udzWm6rjGiL8sbZQm8sfgBDAW
	6OJT9AXo/hXCsgakwd0CurKHRxDVySIEgOlNTmt1X3FqokaaiG7foeO3COVvwFDG6AAF+/jh1EY
	SUcX+WKMPknrs+I0hS4L/IME+ZICU2
X-Received: by 2002:a05:6870:568a:b0:46a:e87f:a7f3 with SMTP id 586e51a60fabf-4afdf031ac6mr3908835fac.2.1794601397474;
        Fri, 13 Nov 2026 12:23:17 -0800 (PST)
X-Received: by 2002:a05:6870:568a:b0:46a:e87f:a7f3 with SMTP id 586e51a60fabf-4afdf031ac6mr3908812fac.2.1794601396986;
        Fri, 13 Nov 2026 12:23:16 -0800 (PST)
Received: from crwood-thinkpadp16vgen1.minnmso.csb (71-34-16-191.mpls.qwest.net. [71.34.16.191])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2200c91sm1914434fac.4.2026.11.13.12.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:23:16 -0800 (PST)
Message-ID: <dc20c6087569c0bba7469216f29832dbb23abd23.camel@redhat.com>
Subject: Re: [PATCH v7 05/10] tracing/osnoise: Per-cpu mutexes and fd
 detachment
From: Crystal Wood <crwood@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Date: Fri, 13 Nov 2026 14:23:15 -0600
In-Reply-To: <sashiko-outbox-212329@kernel.org>
References: <20261113064103.3041704-1-crwood@redhat.com>
	 <20261113064103.3041704-6-crwood@redhat.com>
	 <sashiko-outbox-212329@kernel.org>
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
X-Mimecast-MFC-PROC-ID: B96rJ0YpcYTPbGAS5pT0UTyoy-_DViCIcl-gt222Iy0_1794601397
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-11-13 at 07:14 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] tracing/osnoise: missing migration detection in
>   timerlat_fd_read()
> --
>=20
> commit d34bc9208d90b4be9c903307f53e72248c2ac3b7
> Author: Crystal Wood <crwood@redhat.com>
>=20
> tracing/osnoise: Per-cpu mutexes and fd detachment
>=20
> This commit introduces per-cpu mutexes to protect kthread and timerlat fi=
le
> descriptor state, replacing the SIGKILL mechanism for user-space timerlat
> threads with a mutex-protected detachment mechanism.
>=20
> [Severity: Medium]
> In kernel/trace/trace_osnoise.c, timerlat_fd_read() removes the
> cpu !=3D smp_processor_id() migration handling (which set
> cpu_tmr_var(cpu)->uthread_migrate =3D 1, tainted osnoise, and stopped
> tracing) and instead locks this_cpu_tmr_var()->detach_lock before checkin=
g
> fdd !=3D osn_var->fdd or tlat->uthread_migrate.
>=20
> Can this miss user-space thread migrations when NO_OSNOISE_WORKLOAD is
> enabled after the timerlat tracer has already been started?
>=20
> By default, OSN_WORKLOAD is set in osnoise_options. If the user enables
> timerlat first and then writes NO_OSNOISE_WORKLOAD to osnoise/options (as
> shown in Documentation/trace/timerlat-tracer.rst), osnoise_options_write(=
)
> does not call register_migration_monitor(), which only runs during initia=
l
> tracer startup in osnoise_workload_start() -> osnoise_hook_events() ->
> hook_thread_events() -> register_migration_monitor() and skips registerin=
g
> trace_sched_migrate_callback() when OSN_WORKLOAD is set.

That's a minor pre-existing bug that shouldn't block this patchset.

-Crystal

