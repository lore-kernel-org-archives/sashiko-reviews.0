Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B61E47A862
	for <sashiko-reviews@lists.linux.dev>; Sat, 12 Sep 2026 12:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789214405; cv=pass; b=GD1WGyN4jWQbgeIfY7PGmolvYL3D0GXSTcAzuyWWfGUvSlb9HujmFIu0MhDmsAYkpJ5wv+bj4d7Ev+gUVj4XahBdqCaOB5fD0GI1Y+nI0xvmGbj2bEE2y4L/dTK4Bt5TiS4YfN+tcZD/5TaPUKnBxuah+vfUF3P9SmuCf6uYp9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789214405; c=relaxed/simple;
	bh=DJLwU76RmwdfEAtO/ImX8T8e/PYYw87Y6xqvD9hhE58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+BwiU1YO4ZQjZ7JXKLKkLc6v6iT2EdRBEOaX3tKUMqgM/ThoIpSBQdv7xeh1aIaMIcNrcC9Hpyfmg4PVGC4hlRqBe7YjRQsMVi7xOE/b0kduhaJv9KQxcR8c4ZJo2lMdTs7RjRHf2qOD1/kJOAZfTMkjB5yge3PAyOQuS15XBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdb+AHfY; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdb+AHfY"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccbd478bso109147fac.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 12 Sep 2026 05:00:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789214400; cv=none;
        d=google.com; s=arc-20260327;
        b=YAm6wDWd4vldCvUNEsOH0YspJ0Jnn/EswQuloLovUiOa7aQYjTqt8gQCYbNi/nql6u
         2nvKe/ypC+NLyRHkV2uvRICAKQGMm5u4NaHlqWFjPq2qntSAfVMRaAgN+bIYxv2QE320
         7O5T4lA5ESlgIhJAET2IAKK+jvgRT080JkrXG+wvXfglPU8tqvZVU6z9BR+ZnhM7OlOt
         +/4TjnN51SKtlvbk5FGN/dP8brouczOtJmL8TBl1uKV17Tmx2ntS7/si+p7/Lac02K0m
         G3wsnU88dUud9whqCvU5U+wg5RZsqEp+RJ4KL1lh4KJw9dzofwcQ7N/UKZhsN8uncAWr
         I7TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YghKBDGzorABwgLsb3vWz9Ic4mK6I5Sn46J6CQloWEY=;
        fh=bzS4lM/aJPXUVVzM7ZXP2ar0QUo2xn/bvWtI5toWN9Y=;
        b=aG+Ggr20EAoqJlGZKvoZg8qdilTcqSiaGisfmGcliNeKja7j0dQ1TzCMgCNf9ZNwEa
         Dol1RwrKSSfJM0xQpulXhjw014qUx0JKPZColgDk26E6bT8+Orj+kt8TaiCXNTeDmBvo
         InbWMst7c7N4T8dVsAQeUol586mqNezv1XCOtxY0T9kmYrsq0iaQiNrh+edBgEST10BP
         CoWDAY3AYEkxK9YDwqY3bOPwaVsIRRYUp+5BLz6RRR7jQiQCPuX8PzeQdT45sqTXq+h7
         byfEINgBCFtnnNCDYNncUkwEhtWl3ZxZK6uYIjCJ8zL3XnorWlJS4nbsJO839Adab84K
         UBaA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789214400; x=1789819200; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YghKBDGzorABwgLsb3vWz9Ic4mK6I5Sn46J6CQloWEY=;
        b=kdb+AHfYpjoT+XTAbRpA8LQE84J3NVxvyonxgqd75co9Akpfql+5rKc6AeLxDT2fDt
         X0/G/nx1xI+NeYxNzXCjKpSbrSpt56DuOPto0ltOkd3/n5XRNJnlEgGSPOMkg60+YIXJ
         cvNJTzIs61qwjcNLIH3eZA7QRf87jFzlc+BqHGckkm4WSdmCRuMWda7/AM7p/KQMoXtn
         L2T2J5N0u1bbf2PC7Ww8/1yzn4IClMmTBPuUFk/jVdTaeLcvfCbwD8gPW/vycCZ5rrS/
         Lt42wMOIzVNW+wNsviJzUjOnZmTFuH5CbvpOtwniiPS4DLd1jSD6Qj84GdZttH4uQKuW
         hZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789214400; x=1789819200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YghKBDGzorABwgLsb3vWz9Ic4mK6I5Sn46J6CQloWEY=;
        b=oOwcIzACJp5RfVu9TUYmKAHcHqnU4j7114nzp4DG5cIDXiGtfyUaNYuHPYY+Pq448u
         DtjVP3KtfXRWWwtzOEmoKRtZc7Fc++tO14XYe/j9ovqbWaEIIpm6Fw8oShNMJovq1Jfm
         Sl6b50zthdVWjP2+KcjtRIAXH9G45y+Jvz+rByOdUyOCuGi1m1ao05zyZHLeauyFjVZ/
         2m0C5IpnlbOjFlLNKo5s/nXW+YHdESQZ69kExW52pL6KDMzgC4IwcaveTCuxspK/hF07
         4ueqeJkBk5Brz4ovnHygnFzjkML72mAzca9Mc7+eH30CbTDJHx2S0bOHzYbQmF2bPK7n
         FDiA==
X-Gm-Message-State: AFuF++nsQDfjOx34zCtvR9yz1j0ZyRlv6juv7ezwRxF+m6/1Iy0xiCTD
	x3a7sCNtdnsAFSLyWvVZ3bdyrQEADFIA7fTZDZlgASEK+n0VF84R7pq3giCDsRisHbc0UvHfWe3
	IJs0FE+xdQuAvkTW+S3A571dKwlDaT3NlQt68
X-Gm-Gg: AYBFou2Ai0lUcMB7QylrTdHguT7cwwnASLnOJG2ZFtgpOMTO70N8WQYQGFnjzOG+9hG
	X+V5ipraSouCTE0svuX9g2SKIhoZ4nOjb1FHK34ckrakJ+eyghAT0yzV7CBNDA58xASABOCA+Sl
	9+fdZ4UQabilRiVtvcDnfMmETbNS9cJB8U/iM9Ac4oIeuvtbeycCANJ6yDFGbKPfAYNM7mbQu1N
	0DDFa3dJlVp2Yty/ydzMaMH61C2PokqoyaV5ZzvqnLdb+182TvBeRJC6vA65vWXhWajrHP9gCQg
	gdzsrSvjNo04PXorEeUUfVOOktwKqbGq80b4C2RR9Nw5qcHCiXej+BrIHOAh3tBrZLZc8K7djL1
	fFxt1KeGzYA==
X-Received: by 2002:a05:6870:b9c9:b0:47d:7ee6:98da with SMTP id
 586e51a60fabf-47f5819c69bmr1345392fac.8.1789214400282; Sat, 12 Sep 2026
 05:00:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260912103938.1127021-1-devnexen@gmail.com> <20260912105659.6FC5B1F00893@smtp.kernel.org>
In-Reply-To: <20260912105659.6FC5B1F00893@smtp.kernel.org>
From: David CARLIER <devnexen@gmail.com>
Date: Sat, 12 Sep 2026 12:59:48 +0100
X-Gm-Features: AcwNN1VSn-ZCNd8bo4C1at1sh1g1MVQJlFUnzvIaT3Wa0TcW_A3cdLgKbNn_Ju0
Message-ID: <CA+XhMqxdBB3_W2hdkoMkrM8aoSdhFBko4ky1h4ke0C41CgYTAA@mail.gmail.com>
Subject: Re: [PATCH] ring-buffer: Check resize_disabled before publishing the
 new subbuf order
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The first point does not hold. trace_rb_cpu_prepare() allocates
buffer->buffers[cpu] and IPIs via rb_cpu_sync() before setting the cpumask
bit, so observing the bit implies observing the pointer.

owever, The second is real but predates this patch:
ring_buffer_subbuf_order_set()
never took cpus_read_lock(), we can fix as follow :

--- a/kernel/trace/ring_buffer.c
(/home/dcarlier/Contribs/linux-trace/kernel/trace/ring_buffer.c)
+++ b/kernel/trace/ring_buffer.c
@@ -7465,6 +7465,12 @@ int ring_buffer_subbuf_order_set(struct
trace_buffer *buffer, int order)
      if (psize > RB_WRITE_MASK + 1)
              return -EINVAL;

+     /*
+      * Keep CPUs from coming online while changing the order to
+      * synchronize with new per CPU buffers being created.
+      */
+     guard(cpus_read_lock)();
+
      /* prevent another thread from changing buffer sizes */
      guard(mutex)(&buffer->mutex);

Cheers.

On Sat, 12 Sept 2026 at 11:56, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Missing cpus_read_lock() allows concurrent CPU hotplug events to=
 crash ring_buffer_subbuf_order_set() via uninitialized list dereference or=
 NULL pointer dereference.
> --
>
> commit d554518f86e022de0069fc76033b9d71e9046148
> Author: David Carlier <devnexen@gmail.com>
>
> ring-buffer: Check resize_disabled before publishing the new subbuf order
>
> This commit checks if resizing is disabled on any CPU before applying
> the new sub-buffer order. This aims to prevent a race condition with
> mmap fast paths mapping already-mapped CPUs with the new order.
>
> Cc: stable@vger.kernel.org
>
> > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > index 9c03a555a6ba2..d7e5e4620d096 100644
> > --- a/kernel/trace/ring_buffer.c
> > +++ b/kernel/trace/ring_buffer.c
> > @@ -7474,6 +7474,14 @@ int ring_buffer_subbuf_order_set(struct trace_bu=
ffer *buffer, int order)
> >
> >       old_capacity =3D rb_subbuf_capacity(buffer);
> >
> > +     /* The mmap fast path reads subbuf_order without buffer->mutex. *=
/
> > +     for_each_buffer_cpu(buffer, cpu) {
> > +             if (!cpumask_test_cpu(cpu, buffer->cpumask))
> > +                     continue;
> > +             if (atomic_read(&buffer->buffers[cpu]->resize_disabled))
> > +                     return -EBUSY;
> > +     }
> > +
>
> [Severity: High]
> Can this new loop race with concurrent CPU hotplug events and trigger a N=
ULL
> pointer dereference?
>
> Unlike ring_buffer_resize(), ring_buffer_subbuf_order_set() doesn't appea=
r
> to take cpus_read_lock(). Meanwhile, trace_rb_cpu_prepare() can update
> buffer->cpumask without holding buffer->mutex.
>
> On weakly ordered architectures, could the lack of an smp_rmb() here caus=
e
> the reader to observe a newly added CPU in buffer->cpumask but load a NUL=
L
> buffer->buffers[cpu]?
>
> Additionally, without cpus_read_lock(), if a CPU is added to the cpumask
> between the allocation loop and the final page update loop later in this
> function, new_pages will be an empty list head:
>
> ring_buffer_subbuf_order_set() {
>     ...
>     /* One page was allocated for the reader page */
>     cpu_buffer->reader_page =3D list_entry(cpu_buffer->new_pages.next,
>                                          struct buffer_page, list);
>     list_del_init(&cpu_buffer->reader_page->list);
>     ...
> }
>
> Could this calculate a fake pointer overlapping the cpu_buffer struct and
> corrupt memory when modified?
>
> >       atomic_inc(&buffer->record_disabled);
> >
> >       /* Make sure all commits have finished */
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912103938.11=
27021-1-devnexen@gmail.com?part=3D1
