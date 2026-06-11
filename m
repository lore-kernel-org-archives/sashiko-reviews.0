Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D985A31F99C
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 16:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781193823; cv=pass; b=moHFW9aEoIMknDAbpouxWikwY9ynMm2o03f3z3AFQDTpOCNkO6ThBKjYaqv+48xQvL6/WzeJG5Iwp5EUH9uuJSI9QfyTGvUul5jK5iHNpG/tGYbcqK7MPziplE8O6rTyT64sT2jlyix491BhSeGu7Z/cYjCJxsbcWxBFgCGEY2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781193823; c=relaxed/simple;
	bh=E/uSsonBxsG2I8HRk/4lpDWc2bqhqamee4qK2DRuzas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIO/zbWrRY4TbdJOkq7LEYQ9SQGJjXBytfnbUMtfU1MrRIJ6RFZ4UkpirZ3eSIiTFwXO/ck3NK/U3/G3LKrzSdolTHvoyhHjfw4j0abDkinFjhYra5fabMivv3EBQMG/00bk6LppUKyR6JMMu+NYOvQtWywhWs0uaC8HiIpitU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gcCdEPi4; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gcCdEPi4"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-137335bc3caso10513025c88.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 09:03:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781193821; cv=none;
        d=google.com; s=arc-20240605;
        b=dWpgq5Q06QOt0nSgHSX5h791ZZGz8DmPQHmrY8BZUFMnxD2HQb860DQriMoRCejOYx
         pngTZ0NVRZixZnCJi37d6RlNoKyITP9UzdtcRAgTjt5hDEtDjQTTIHxwjOCMnSFZBjmz
         bk/mSOC83Eur7R8TZL/aEfQnv8VDE4CVx+4QQhWLT9KV+ldkQmAPVNzvFqRnqDZ/0VND
         4ZI7mZYbeUqUJTkrai0oF+F+JqPaYK5wepze7kfeLHS8Hk/FPu3l1qp3LNSf9BIsbUbq
         wYFWy6qfVk7Sg4QtvgNiountDfvZK3rCvVzY2aphiDj7HhIofHwhDZIpIl+vVe9HvvzH
         Heyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0pcWDynRbSH5YpKeYd1DMK6rF4S1uoY1j6VB0VFhuRk=;
        fh=wqYu1lGltArXwteD7WYVag+cmyKKmwUIlTY51VAadtQ=;
        b=SqyElffxJOIQNmOtYNQBoJkFPwjkurHGBnUpnfDSUqJ3ZQbq+fqYuZUx5WvBoSgi/K
         Hq7haD/QKdZ2YI84Dsj59F4zPCv3wU6lQK+pVCC3aeqJnYyrWkVb7AT5k2VNG6alJM6e
         Wb3mr6rxziMRwS7+rNz49a4Eif9/BUDoptvndirGyPIDRZXbBMLIf0kzK30kxxnSO66t
         12g1Nm6hqRIrJrZFEOgsJdwErVxAFr1yG2OxuXJOUqnFfyUdjLOZzmiHjDo1q+jR5Goz
         Eg3wxrOPyGs7XiHtwo1xHijQUbz4qWFtJ99Pna+s8yNUps9toieuifDsRUZRQZiPziof
         2V8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781193821; x=1781798621; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pcWDynRbSH5YpKeYd1DMK6rF4S1uoY1j6VB0VFhuRk=;
        b=gcCdEPi4aykqPL3LP03Ut6o6eBvM4OQ1JaQNeqfOTvUkrCaNwBpF7ULJ87YDm5qSOk
         sQdn6L4F35lhUZlGPX1Gjh/H0Mrgfd2qD1YggHjgP8BUr3II7HrRukdd0fq8kGG/KuaT
         ZrJ/uGXKK4LwT9QCParnH+21kM/D7J2yG8QyVelpMyjDb6IUdFihWhyks+d6qTUFDLc8
         BfA1F4cZs3aawjR5YUUDcpIjfs+drogkLk8fk2qFiuwrYnzgWnIXPPeKHQ+1ulHeV3ir
         4Vs/cf16VtSw5H15WicQZpE4y9TFblbx//WctIbtmrCtDjf8+jUcdm14xMXUTzbLE2qU
         lDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781193821; x=1781798621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0pcWDynRbSH5YpKeYd1DMK6rF4S1uoY1j6VB0VFhuRk=;
        b=bUQSBf7s+gCsOMzKS6gg0kSUbzQyf+eSvj9oJD4AYUdsch9sXl0njvw5/AsWgYwK94
         gSg9DB4H/3kIrw17cl7+M1vsWuiwVVft5+o1e5ln1dCMdXiazLNMpAkjN6sBLTf8XDzx
         8/6PYBa2yEoE9oij0MSfPn2FN5W5A7tkWQSeS1deOarEX1NbtT1qLDDiZjwldipAcnC7
         mxcWSjyiSdn+JO9z2kTcP8Ok+Mq5hYEzylfT3hy3RMv0vg12U0XeNuFSdqJPgsWxplrp
         JtV+CV0smD/ljGkQvascEBZsk6uB2M7F8FsEZ6Ug194Vl0qHoTqzrZXH6IDFlZ9hA09d
         7VOA==
X-Gm-Message-State: AOJu0YzuiulTx/I2CIh3htwOJhojYVNHoXg2S0ViDQs3XJk8jfJ+1s3w
	vcnhn7pZ2ojdEQJmo0lf0lmKp4nwAqn4LvRxWO+KVVKGL69zW/yT/gLE+w4i2VpETCeGW5xNvwC
	Nwj2nX4mrl58BIKXAUDouMb8XFVxPveuLavrz48TM
X-Gm-Gg: Acq92OE4dnYoVVKRCyX1e3XH9F5pTX2dIucg9eIOy/j5lT8HuFsKQ7cUcDsqxZ1gDXj
	uoWeTh6ompm8CVHoDVvnIIpOwHZt1XZ++NegyN7bSqF+UO6MUSNMTmvdgj3zMMgeEr3TuHEHy+N
	YfjSvWqg/lPKCoC/sXr/xqPYOHaYtK5IlNFgnRwM61AVZwZImJg4onbNfCVmWpY5VHBRhFKQc/G
	3CQy5UJBwhajYDe3/rzM61PxwggKclMZufE+RG0pUlLq0+T578w1ZBvU87LhGfONtaOWK2JZSQx
	0PsgCR8=
X-Received: by 2002:a05:7022:403:b0:137:64ad:76d0 with SMTP id
 a92af1059eb24-1384211e6admr2000029c88.7.1781193818067; Thu, 11 Jun 2026
 09:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610005338.2967132-2-seanjc@google.com> <20260610010314.DB8861F00893@smtp.kernel.org>
 <aim4lld49oqLrthg@google.com> <ainFwSTb5-8itT9y@google.com>
 <CALzav=fUfhGP-DMsDR=4ZX2Cap=-L=c-1kwxTaUxSdknC_ir5Q@mail.gmail.com> <aioBW3ljMyYhYK_4@google.com>
In-Reply-To: <aioBW3ljMyYhYK_4@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 11 Jun 2026 09:03:10 -0700
X-Gm-Features: AVVi8CerQa96lyFJIrqKoChRgSwkV-xrLrw7UevCQeX9WtaD36Cu8yeTh5qkMkE
Message-ID: <CALzav=d4q+ckkSUoZKhWWW+LiGpwOE7yAKyDmrLhmGrmh4kLmA@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] KVM: selftests: Build and link
 selftests/vfio/lib into KVM selftests
To: Sean Christopherson <seanjc@google.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org, 
	Josh Hilke <jrhilke@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 5:29=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, Jun 10, 2026, David Matlack wrote:
> > On Wed, Jun 10, 2026 at 1:15=E2=80=AFPM David Matlack <dmatlack@google.=
com> wrote:
> > >
> > > On 2026-06-10 12:18 PM, Sean Christopherson wrote:
> > > > On Wed, Jun 10, 2026, sashiko-bot@kernel.org wrote:
> > > > > > diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/t=
esting/selftests/kvm/Makefile.kvm
> > > > > > index e0ddd3ff9472d..14316358fd9fb 100644
> > > > > > --- a/tools/testing/selftests/kvm/Makefile.kvm
> > > > > > +++ b/tools/testing/selftests/kvm/Makefile.kvm
> > > > > > @@ -257,6 +257,7 @@ OVERRIDE_TARGETS =3D 1
> > > > > >  # which causes the environment variable to override the makefi=
le).
> > > > > >  include ../lib.mk
> > > > > >  include ../cgroup/lib/libcgroup.mk
> > > > > > +include ../vfio/lib/libvfio.mk
> > > > >
> > > > > [Severity: Low]
> > > > > Does including libvfio.mk here break the "make clean all" sequenc=
e for KVM
> > > > > selftests?
> > > >
> > > > David and/or Josh, can you verify whether Sashiko is hallucinating =
or has a
> > > > legitimate concern?
> > >
> > > That is a legitimate bug in libvfio.mk. Want me to send a separate pa=
tch
> > > to fix (see below) or do you want to include as part of your series?
>
> If the bug can be hit without this series, send a separate patch.  If it'=
s only
> relevant once this series lands, probably makes sense to include it here?

This bug affects anyone that include libvfio.mk, so
tools/testing/selftests/vfio is also affected. I'll send a separate
patch. Thanks.
