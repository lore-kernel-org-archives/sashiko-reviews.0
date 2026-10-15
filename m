Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362F8477E20
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 20:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094418; cv=none; b=OaCYKkSGUL2I3N+nBh0C0hHcWHOS1aAK5nSbUwAxTXpx94p3++STeSvo6a3kUQL+I8eVwvuZE9PclXaBZ7Hzy2EcMhF9Fb7WdUP4Ldn1/vb1qa1E+RNVUn0/OF8fGkmUxFmtnSYyrzupR8vKtqW4TThZ/gM7fg1M8JNmyMMvq6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094418; c=relaxed/simple;
	bh=ZdV5BaJIv/kE8+aeDqKQTezDSi8KwwtxS2Acj5Oy3oY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FDhg6KjuV0GPnboLc738YgaxrdwxTGcrGmVOXg649AIcvbqU5wN8QZuHRR6R8NT1z9NPUzlCH6As4k8H3bWemkb7NJOTnLzEfu0z8jF7wnUmQLxOXbrevin0sx50HxLlJ68kG1tBwaj4nNYPp55vvS5KNdS4EtLLPFon1wBWXos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JYNsXiTc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JYNsXiTc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792094410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mJGzDfyie7g0wS80PP/jhU5GIsqjteLyTWE7rXt+IdM=;
	b=JYNsXiTcDYXYHBpgIMxHMSmsGfZQEQ2vSd1u5ITafS2bXZrJKV/Wd4T7X+kkPqXrtKP0B1
	SMVnmShhcjgW8iPBWwB5r8RdSAbE3Cc2MYj7Bm+c+OUWLcidoGs9MVtDNeVip5nA8mOy53
	q4UQL2bMxi+36n9nFLOq0+wvaOUlhYw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-EzPYTN4CMRKM578M_KuHnQ-1; Thu, 15 Oct 2026 20:00:09 +0000
X-MC-Unique: EzPYTN4CMRKM578M_KuHnQ-1
X-Mimecast-MFC-AGG-ID: EzPYTN4CMRKM578M_KuHnQ_1792094409
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b994cb09fso40287356d6.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 13:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094409; x=1792699209;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ARFS9DZSP4dQZPdHoed8w0xeryUKGtwmSApYre2IIFw=;
        b=0jj/JmbD+xeOcj2i8VF5SSKySK0zR3isv1fmqTmVI/eQmy3hWcgKoP3M/73g25jwq5
         DGzq+zkf3nRiD7P1vudl7n+AM0EluzvzR4D9QbT5KmVfyWCowlKrX8qya+sWrioD6zyB
         eMsCk83nD6FRWqiMGZ48j5Ro85FVpdkl4JDj+qkZZV4M9YwAvWXY95FnBU8hmFJ2s0IO
         xjUgbwlXFK7oNUOpp99bWZbkphP6U+vTorDw48F3TxkR7BjfUyx3OdtCJCRKYfGtSd8N
         F01MUxQDhkXzTTBryxKKZR/IKjiN4WrbGcbWuAY5HrcHfmS6I1wuMkhxcNSSorRKvErG
         F8IA==
X-Gm-Message-State: AFq9FYITILGkHA+MuGzAKBJegZakmp/lQWh/2Uy6ldARD9wafSWImSNp
	HhhU2va2y6VeveWIQNULX7fhtSEEzBlMkLPcfaVJLxmzgRGW7xkW0tTneaJ7zIHzpVjciN2QSXF
	f/rOUoC6fav6uIoJqO8z5D//EpFrLufOeTUgB6jEXYjW8OzWSrB1eJi4yG4GsaYNfVeHsjPPYKg
	3vbOsfBq5XT2d/TN2xd7hxkfDpcu6mkU/NoefNbZKes823pudtgJg=
X-Gm-Gg: AYBFou0sXRB2oaZ7DJfwj2mcmUA9kWz9QfuKOSJq/SP2PY4b/xb+ik7YIquIZ1/bNVL
	jopM1PGzGNK5rqLQwtxaLJqYFw6qc7m/SbXYsQgVMzpuDFIuJtWrRltvIT2rnbTHD0Z4Ro3915A
	5El91Cu0cxbYblXa/PV68elz8RSdmdk3u05D1/HGN/7lIlH0SlBq0TQKISjqdbS14Mp/mjBzk1j
	TEKoX/UygcAZRhWbLEIu9eBZJ+mrBqJdKMSJIdoap8m45FYnFL76replCEVhHG40PwDazgQ8i9C
	zPuXPgKCqDDQ2x/5Fjdz8xcNIHY48xjadtfahabHTU5Rz0RBDsFDP/OoqJ40uD8FuUcDyzeTCI3
	o1aZYF6th+Vm295RngQJ+ZivjarJ6+G6bTeYm90G5bDMYuEPgurQXWY8=
X-Received: by 2002:a05:6214:518a:b0:911:9373:a171 with SMTP id 6a1803df08f44-91b5556ad41mr329656196d6.30.1792094408589;
        Thu, 15 Oct 2026 13:00:08 -0700 (PDT)
X-Received: by 2002:a05:6214:518a:b0:911:9373:a171 with SMTP id 6a1803df08f44-91b5556ad41mr329654976d6.30.1792094407643;
        Thu, 15 Oct 2026 13:00:07 -0700 (PDT)
Received: from crwood-thinkpadp16vgen1.minnmso.csb (71-34-25-140.mpls.qwest.net. [71.34.25.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcb8c4adasm4342446d6.1.2026.10.15.13.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 13:00:07 -0700 (PDT)
Message-ID: <8ae7b1fc1ca394e1342688073359f97fc275f4b6.camel@redhat.com>
Subject: Re: [PATCH v4 7/9] tracing/osnoise: Split out per-cpu variable
 resets
From: Crystal Wood <crwood@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Date: Thu, 15 Oct 2026 15:00:06 -0500
In-Reply-To: <sashiko-outbox-171968@kernel.org>
References: <20261014220759.908839-1-crwood@redhat.com>
	 <20261014220759.908839-8-crwood@redhat.com>
	 <sashiko-outbox-171968@kernel.org>
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EfeUekSohOs20qoUpVqoDM1qj-cmwT9uoiBPJoXgptI_1792094409
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-10-14 at 22:21 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] tracing: Data race between osn_reset_cpu memset and NMI handler
> --
>=20
> commit 01cd6ef0e171fa1526bc0f401fc2072fe284c438
> Author: Crystal Wood <crwood@redhat.com>
>=20
> tracing/osnoise: Split out per-cpu variable resets
>=20
> This commit splits out per-cpu variable resets by resetting the per-cpu
> state every time a kthread is stopped or an fd is detached. It uses a bul=
k
> memset to clear the zero struct_group in osn_reset_cpu() to avoid zeroing
> individual fields explicitly.
>=20
> > diff --git a/kernel/trace/trace_osnoise.c b/kernel/trace/trace_osnoise.=
c
> > --- a/kernel/trace/trace_osnoise.c
> > +++ b/kernel/trace/trace_osnoise.c
>=20
> [ ... ]
>=20
> > @@ -409,6 +379,36 @@ static struct osnoise_data {
> >  #endif
> >  };
> > =20
> > +static inline void osn_reset_cpu(int cpu)
> > +{
> > +=09struct osnoise_variables *osn =3D cpu_osn_var(cpu);
> > +
> > +=09WARN_ON(osn->kthread);
> > +=09WARN_ON(osn->fdd);
> > +=09memset(&osn->zero, 0, sizeof(osn->zero));
>=20
> [Severity: High]
> Does this non-atomic memset race with the NMI handler
> trace_osnoise_callback()?
>=20
> If osn_reset_cpu() is invoked from a remote CPU while the osnoise tracer =
is
> still globally active (for example, via timerlat_fd_release() or
> stop_kthread()), it will concurrently overwrite osn->zero on the target C=
PU.
>=20
> The target CPU's NMI handler could be running concurrently and might bypa=
ss
> the sampling check if it reads it before or during the zeroing. This woul=
d
> lead to it executing operations like:
>=20
> kernel/trace/trace_osnoise.c:trace_osnoise_callback() {
>     ...
>             local_inc(&osn_var->int_counter);
>     ...
> }
>=20
> A concurrent memset from another CPU destroys the target CPU's local_t
> guarantees and atomic operations, corrupting per-CPU state via torn reads
> and writes. This replaces what was previously a safe single-byte
> osn_var->sampling =3D false assignment with a bulk memset over the entire
> state.

Ugh... so on one hand I wouldn't call this "high priority" given the way
the data is generally read as deltas.  Most of it doesn't really need to
be reset.  It's not limited to NMIs though, as we don't disable
interrupts or even preemption here.

On the other hand, now that sampling is unconditionally cleared in
stop_kthread() as of patch 3, we might be able to just drop this
patch... but not without a respin unfortunately.  There was apparently a
patch shuffling accident in patch 3 where tlat->timer is used after
memset() clears it, which this patch undoes.  I'm surprised Sashiko
didn't mention that... v5 coming.

-Crystal

