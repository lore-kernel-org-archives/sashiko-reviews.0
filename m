Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB989355057
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 17:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789320209; cv=pass; b=a6l8+AhKMs1WR4W4XMjSlMVryGb1R9NWkwXrENMwPBXyCOEykUvi+bxYIrynZS+bW99e/sSd2E4/gSyy9zW7FOAdohtGYXUqAlr3ezZgVZf+8n7PJsT4Pd0+ZKLouQjxgfstPr2nfqfTb49wymdHvOm/23aa5b5vV6FGVUPIBt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789320209; c=relaxed/simple;
	bh=BLEwIST5LDO00rmpC7KBzeJd7ltokL0w81FVqI46QfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mkqvf74nanRFvXq83cKYzq3qAajAH67qOaLIFEq+77wVsD6B6NEUgGrLuo5nnBFzuh2nQPebLkfV50vJo027lEdhf8fqOwLT5JWlQVrqBD0FCZ6QlCmGMqieZ6JEG4RutPo776519ey2iWmH5AGHMtOzIhMT3coHgkWQtYYZ7eY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdZVMeIQ; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdZVMeIQ"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7f4e729368fso2709160a34.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 10:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789320207; cv=none;
        d=google.com; s=arc-20260327;
        b=W5PBHJDZZWo/Oj8xyeyItR/47FuHrc6nDUjEGOGw2dTBk22OWzvrfw/8wkIY2OAI6y
         KzRQQYUyab9HjS9ynLM3nR3MUZzMMTd1IfoN3jRqXbSxVjg3Xf04hGTM9xRXJvsmZkaO
         zz8XQ9LJ9CJH64H1wDfnD38ToIGimrSBg9aUqYUb1V/KSDMnj7FkwoHs9Gji9ppcPkDT
         isWJH7zmUnfofxf5Zb4iXyVkTqDflfxWbPtp6i2Wzm1zBVhyx21gp/pQ5V8GD+oHwhCc
         xKcNz89/+l46Wk9b/8qbWvCz2gG6Ura84VP5dhW6eazKxUmklpom4jXlTeT+pIxIbT0w
         06Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=116h53yk479YgNueOJV8xZVBkZ6OS1X3DH0lCR+acgA=;
        fh=bzS4lM/aJPXUVVzM7ZXP2ar0QUo2xn/bvWtI5toWN9Y=;
        b=aalI6DqJQ7dwO0gaBEpJY9qtoqjYbWqWV64RmX7XHr6u4ZqlpJMv3qUZSt+eGKkQzC
         9MEX6hZk4mC8I0Bk4XqYjLFMa5595fPTQpZDvjMbHNt3LPrLIc8bL8boWwRXT1tvwnLz
         yUhjf1wgi7xtn9BIVrzI9i9r+835/wqza8hiiFiHNIeXsbPO1PAwr7ohMOZTBanqnn8Z
         VXH/0+Z116agp+enMIcm2pmA7vN0UwGMj+cFbm04CpBdXRVdnfzHVOxzTuoG1wje9per
         TfFHQuErQRaGjCB2KmDjaf8BZTj2ESOf6knYOUDG42vWSpSX9UZRvF6/AJqAYiPg0JfD
         Z5LA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789320207; x=1789925007; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=116h53yk479YgNueOJV8xZVBkZ6OS1X3DH0lCR+acgA=;
        b=YdZVMeIQQFS/NJJ4Padnu02LBfO/b8B3D1vKgjI6eoIH8FiyVNnb6vEaxe1qpcw965
         jghFshuHcRnm6bz65ydgrvqXo5Kel4BmZFF/uG9ws96YIewJ1/5o47ePlLi9ADsiEeKK
         uNUjwKIRItZheR2u8uq3yx7LqjfqCZmSJeSNKv/INrb63ExyE+vRVzmUvvZM3dhhsdvk
         yyfRbHH6Q5U9/G4LZdDmFpM17kfrlaMeBqQbIffYf/Fa93WnemNCe2YxaXtaP5QwRe2F
         D3Bxw1mWO0Vskh07nLNX/JCimXnNT1Bnso1G3TKjWf4KMZCe42AEnMC9MbgZYjg//YI3
         CEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789320207; x=1789925007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=116h53yk479YgNueOJV8xZVBkZ6OS1X3DH0lCR+acgA=;
        b=QfHnY/jk6mK8l/k7dQYnRGGpAMYR1OQ5+/MzrZ9HJpbD/hKHOai0v6h1ToG9I82BKB
         ywTIeBdLdTvTpKQFb7LhyfOBfZpRDxEF4Li+D+6EgfNHDNvuQY6ff3rv2ydUB58yZ1Bg
         tm9zS9Ao2Gz9h2FprTo9CEmTry2eiaqWqEbwQ14OQjEQIJ7WcYsl7dWcSzx10o3aipRY
         /a08wh6prH0+iGJF/xSOAx9knqhgsla1pU+MsQNQFGVlDFM3KRVjY4z4rosTgllRZavB
         JHzTbQIHpJHZp2Dthq+D9QBcaRdhE185zjf4sZNgbWkYn8/Qvsb03cmV4zjlCt19Gd0d
         oiFg==
X-Gm-Message-State: AFuF++lsHmeKEktDERSVSE6pn+Mj4M7wxQozBTGeceW3seY5AJofXc9p
	LMIrDtYq7uSBxR8XQi0q7neZT3sBcmn1CkYQBKsgIUWrS9XJs+XQrrzD0fB0Q0j94lhsCiFe4mT
	r5xp4NND+DP9U2fBKMnJFMtTJiS7hhsk8Ww==
X-Gm-Gg: AYBFou29C4YfjmUjdTJBlKerujziCO0t1OtHZOUP7KcAGibWvM8gQPOVoymRsd6fKxU
	yydR4EKQwLA3Y/mIOleaWCcYMUnm6s5pe0ooduUjCmeWmCXUGSu7950xWtEwZSNicHSqjyIZepa
	SPduzpQm9hy430KxEJImuz7wNeKyQNj7Bl9xsV91sCnvPdrUt+8Cyb+Pu3nvvFsT+oUGfPjoAbJ
	Kmq8UbXUYAZNvJRU6AJuRUyDr5Q3lT9Y8kHIVQfZ9ASwKAywGR/4KWeCnnU6HXv679kht/uOcvl
	XceHYYSn3gtqaCm9Gf1dC1HI5q5R3kTA3TSRFyeiXGax2Jq9b7Pd4yMnrhJhoBu5WSlQqt8yPV/
	3KxPBkXQCFQ==
X-Received: by 2002:a05:6830:2815:b0:7fa:ac4f:784 with SMTP id
 46e09a7af769-80400c14ad7mr10314969a34.16.1789320206490; Sun, 13 Sep 2026
 10:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260913133829.15307-1-devnexen@gmail.com> <20260913134906.6E8A01F000FF@smtp.kernel.org>
In-Reply-To: <20260913134906.6E8A01F000FF@smtp.kernel.org>
From: David CARLIER <devnexen@gmail.com>
Date: Sun, 13 Sep 2026 18:23:14 +0100
X-Gm-Features: AcwNN1WzO-nerU_lJU4svW-jy3jtAyomNFAZ7_LJcxUSoMWwJnch01xQbz8oPGs
Message-ID: <CA+XhMqz=DgaOjVoNxbm6BUtQ22+5JBQkqYVp6wBD2sSntuFsvg@mail.gmail.com>
Subject: Re: [PATCH] tracing: Take trace_types_lock when dropping the
 buffer_meta reference
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This time seems legit I ll prepare a v2 at some point.

On Sun, 13 Sept 2026 at 14:49, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Reading a per-CPU buffer_meta file for an offline or unallocated=
 CPU causes a NULL pointer dereference.
> --
>
> commit f8d13605bef286fcf84c808917e1ab8eeeade189
> Author: David Carlier <devnexen@gmail.com>
>
> tracing: Take trace_types_lock when dropping the buffer_meta reference
>
> This commit fixes the error path in tracing_buffer_meta_open() by using
> trace_array_put() instead of __trace_array_put(). This ensures the
> trace_types_lock is properly held when dropping the trace array reference
> if ring_buffer_meta_seq_init() fails.
>
> > diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> > --- a/kernel/trace/trace.c
> > +++ b/kernel/trace/trace.c
> > @@ -5881,7 +5881,7 @@ static int tracing_buffer_meta_open(struct inode =
*inode, struct file *filp)
> >
> >       ret =3D ring_buffer_meta_seq_init(filp, tr->array_buffer.buffer, =
cpu);
>
> [Severity: High]
> This is a pre-existing issue, but reading a per-CPU buffer_meta file for =
an
> offline or unallocated CPU causes a NULL pointer dereference.
>
> A user with privileges to read tracefs can open and read
> /sys/kernel/tracing/per_cpu/cpuX/buffer_meta where cpuX is a CPU that has
> never been online. This invokes tracing_buffer_meta_open(), which blindly
> initializes the seq_file via ring_buffer_meta_seq_init():
>
> kernel/trace/ring_buffer.c:ring_buffer_meta_seq_init() {
>         ...
>         m =3D file->private_data;
>         m->private =3D buffer->buffers[cpu];
>         ...
> }
>
> Because alloc_buffer() only dynamically allocates cpu_buffer structs for
> currently online CPUs via CPU hotplug callbacks, this pointer is NULL for
> unallocated CPUs. The subsequent read invokes rbm_start(), which immediat=
ely
> dereferences the NULL pointer:
>
> kernel/trace/ring_buffer.c:rbm_start() {
>         struct ring_buffer_cpu_meta *meta =3D cpu_buffer->ring_meta;
>         ...
> }
>
> Should there be NULL validation for buffer->buffers[cpu] before allowing
> the file to be successfully opened, or perhaps a check inside rbm_start()
> to handle it gracefully?
>
> >       if (ret < 0)
> > -             __trace_array_put(tr);
> > +             trace_array_put(tr);
> >       return ret;
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913133829.15=
307-1-devnexen@gmail.com?part=3D1
