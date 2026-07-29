Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FA64C9541
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785336673; cv=none; b=C6ZkGNYu1nHdFIH670o4veiIljLnljzIQea+2K1GCvjQe9KSY0wjrQ/m4T8xfTZkTgYOXlLH4UX3qlue4ATgM5aQoVvN27rM5yk0GMaAaq4iGxHnp4c9yIq3a1YNksG7kTzfOqLx0eu6iXDz0j+lh+mTwG63EosAO6qIDjPTF/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785336673; c=relaxed/simple;
	bh=kSvkCUdzOU4y6Z/U3RtuFqdEwxLpWtZD30RELNFIgcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gs06PYEQzc+L5Yo59JQvS/YBGiwmYq3usz6tsC3Ep3lFk4BvBeJywaQD+vIlA7eKj52xg5Z1v4y/1IU1659zO4vjAbdgGGqnMmN+iAoUWt82nigtsMxmXGdqhY5dlltGSFETJW4lHirP2ROViIGNHsKhCZ/Xnwc+oZOoxMQravM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gRxfCTp6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gRxfCTp6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785336668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kSvkCUdzOU4y6Z/U3RtuFqdEwxLpWtZD30RELNFIgcM=;
	b=gRxfCTp64XU5byWdrM1ItNNDEphIudeks6CuTTOEki0zQx7rHFuUAiLMectgNFrqySzyvA
	XvTFk78vkby2BYTExsvM7afN+M2Ei94rWGrWb94o046kqwzJB7RGr/ajeDbhQUfm6YXuwm
	+EqSR96IR7NdS7ATp+3n06H/658qIGU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-gdRa8fLlN1qirkmT3e2kNQ-1; Wed, 29 Jul 2026 10:51:04 -0400
X-MC-Unique: gdRa8fLlN1qirkmT3e2kNQ-1
X-Mimecast-MFC-AGG-ID: gdRa8fLlN1qirkmT3e2kNQ_1785336663
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c15ce19923fso100218666b.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 07:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785336663; x=1785941463;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kSvkCUdzOU4y6Z/U3RtuFqdEwxLpWtZD30RELNFIgcM=;
        b=ZAcgbuM2bdCjah/6i3QSZs70skmHFkGSmYLhpLLmzzrPj1wa0eeC/LxCX/cGoaxc2z
         aCoAIf43IW9mK3gd34gjmHxnDaNUbEVQmbPCjPU6c84V0SNipVuPJzTKNpeVKAhiTRlk
         s01R90mKEyda6u0Q17Jdm3kVtyxKuBM7y7srM/Z+R6XNXuFBRh5GZ2zfuZ0iu5woSDrU
         apRVhn9TU5xjKt3d9sp5t2mnqX6pTXN+k99MR57nu8X0/7yoG9UG41M0MCEfniKYiRxO
         X0r3SCtdi/gGRPAIGyl2jTlOE1Yr4cnRUfpY2B2AwPSuFyvGTmjz/sew2gTXQyc223ci
         jbJA==
X-Forwarded-Encrypted: i=1; AHgh+RpU388Km71zNKmDm40i8xZG/4KpFiVPT8ZqM26Br1DeNssjtpEZz93thgMCZ0PqtA1pMdgPRG8+YWcwM5OZBHY=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywz77GMaw3njtZaurO2sJVL9h+SciflBbBsbD2pPJ58JCv/D/ls
	RnxQZ9A19KC/S4+lUN9MDgercjv+tc4/z6N5H08qPmxKzUqGd9Yyqa6rjiCbCA2H/Y/3/Yy3UxB
	O+mc9JsE6qUMjuiVo83SG0JfBZk+qrgCjmG1OSZfPP0csMVNNhZciophm6hWgEJa/q0RftRhCg3
	Du9dcunjIph+aFGySfZT9tCteBs/ALTTxSXuXriLAEiIT5
X-Gm-Gg: AR+sD11SB09K9os33tzCcgt2OT9hiEt60tjlQ394+1RV+VZM1LNwbF5CeOd5QfyHa7H
	zuHVtVWl9eCs1xdftuUE45e4ruEvbl+aPe1kzHAhkykcrAeKrExjTP5zMxPZrfOoFZoy9EPtUhN
	7PPt9LHpGs1cxmExaGUcSTqJoHxGkg8RIhZCBE7FFsLJEFURnzVXqS1coxF2S3opO2Wkw8Ym40H
	24D19kPMg3pvZdbO7XULEScqAjrin1p86p0M7rzaHNR54c=
X-Received: by 2002:a17:906:ee8e:b0:c15:9709:fb9b with SMTP id a640c23a62f3a-c1f721721d9mr400206466b.44.1785336663146;
        Wed, 29 Jul 2026 07:51:03 -0700 (PDT)
X-Received: by 2002:a17:906:ee8e:b0:c15:9709:fb9b with SMTP id
 a640c23a62f3a-c1f721721d9mr400202766b.44.1785336662594; Wed, 29 Jul 2026
 07:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724170132.3783816-1-murp@redhat.com> <20260724172024.0648C1F000E9@smtp.kernel.org>
 <CALYDSrQhUbKDHsPnQqp0K4WMe2iZC-G1nGrLT6eQ9doCqdVXKQ@mail.gmail.com>
 <CANiq72nJ=7TAjtArF2VzDZqwKDcuMFjeisD25R2GuA0NiJwk-Q@mail.gmail.com> <ttiwqgc@ub.hpns>
In-Reply-To: <ttiwqgc@ub.hpns>
From: Paul Murphy <paumurph@redhat.com>
Date: Wed, 29 Jul 2026 09:50:51 -0500
X-Gm-Features: AUfX_myhMuZmpek9DD990HKFWALYcBn_pw4bUkQiobwgWdJq2-vFJFMPfLONtM8
Message-ID: <CALYDSrQ=d3Y6yOt99rOnw6dDonf-4M=yY=gCP0cAuu99bpzdsg@mail.gmail.com>
Subject: Re: [PATCH] rust: enable fentry support
To: Vasily Gorbik <gor@linux.ibm.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, sashiko-reviews@lists.linux.dev, 
	Paul Murphy <murp@redhat.com>, ojeda@kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-trace-kernel@vger.kernel.org, Jan Polensky <japo@linux.ibm.com>, 
	Eddy Stefes <eddy@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NTF_zbh332QZasafiGmjMlhn2gVF9pO1yFeisOU6olM_1785336663
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 5:58=E2=80=AFPM Vasily Gorbik <gor@linux.ibm.com> w=
rote:

> So I do not think -mrecord-mcount Rust support is only needed for
> s390. The Rust build path needs an equivalent of -mrecord-mcount when
> FTRACE_MCOUNT_USE_CC is selected. And additionally an equivalent of
> -mnop-mcount for s390 (this is debatable, we could check if this brings
> us much or we could drop it).

Right, as background, the llvm x86 maintainer were uninterested in
supporting these options [1] when I created the PR. I think the
argument is roughly that these options are bespoke features for
building this project. mrecordmcount already does that, independent of
the compiler. I think some llvm maintainers hold the opinion that
patchable-function-entries is already a sufficient replacement for
fentry.

Digging through commit history, the answer is unsurprisingly that
using recordmcount is slower. It's certainly more convenient to have
the compiler record them.

[1] https://github.com/llvm/llvm-project/pull/184641

