Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BC046AF08
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515494; cv=pass; b=nBJzL0xmB7PpuNxDYOkDLKf9rQ58f+C0PzZqdLPQbei14jUeiN++wZMM0plEuhmAe+wqfGqtBRN0yjz8kqn8MT2BI8+1Bx1pEYB0bxnMa6mwD0SSVfe78s5AQerIwASzcoqNbPjeWJFxVihzNiY9EMGFIQaxnZludjO3tDcEhJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515494; c=relaxed/simple;
	bh=g3jhdMOgt2auKeqJZC2qsgnXeW6Etk1FtxDSQv7KpuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HStEUPqhXiz9xQIZIPmmlCHD//y7Scy5Hken4lYtyCXykJ4A4NRUexH8M7Gfm0FBo1mgYssLazt38lN8bqfxV5wZ7gd1riEdpH/fG/j9mPjaUpVaCgTJrulf73DSpysZaSw9NA8HuMqyhv890wqKpW0Zb9S9a5KQuHSyeWkbFIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=X9ixoahY; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="X9ixoahY"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e9ecd7216cso303437a34.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 05:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783515492; cv=none;
        d=google.com; s=arc-20260327;
        b=RqZHAlAXgd8nRnMttFhVfS+5WerSCwP5h8zoi2hojvxSRQPXNZiLTyAsdxwNiWkK9F
         YdkpxgPY9qpWEQizS6vHGbujjpt0qWSkUSdmFB/kU/Op25sfD5a++W4Uq3qIUTcYslz5
         JNa3FGLCholpVOVYokbqK8Or1ykAO+weHn8eJfJb0jST+B2Z+C5xPspCe+Ia92oSYP5D
         2Xg0Th5ztwRwA6kAXfe/vthbbTSVwFu4ctBwVtRqazw66kXDwnTCw0rKYlHDSu9V+Qid
         aYfmBhOVgEu7CzRtqbStF/1+8XNG8ZPDbkBIl5duBEu675oEiLRvtF2RB/B12qN/glA8
         FnLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g3jhdMOgt2auKeqJZC2qsgnXeW6Etk1FtxDSQv7KpuI=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=QBXWq/O5BCPqc3+bSpyb3TtiYm2vJITxNTmdd1RZGkdWiDQInyYgFpSYa9F+W2Clcw
         kRk+N6msJ6d3o/fcuniuxk5GhVMg64AbZRy2eNgJGrHh4RJ18NhcgecH7JAjbNCqqdnm
         7okA2V2LRSfxJt9hBUNxl2cb0OaHBgKVIBIXFO8OI3vcpDqljQquI6fCJmcdrn9/SMko
         YI05GnzQHp+FuwFHmIHNj5h5PEDYY8RGkKKt7OiQqZP169PQehaWfG4FdX4u59YHwKjI
         +M1F53CQwuahs49Kw0s9wJmYAUW4Mg3T3vianL/odGAXI1dXXNL8axMt6Vk9ddRcEgC/
         vQpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783515492; x=1784120292; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g3jhdMOgt2auKeqJZC2qsgnXeW6Etk1FtxDSQv7KpuI=;
        b=X9ixoahYfXci777tA1CdH7AYw9CpQmPuirhU1I6QK7aAE6uhDuBfh+rUdu8xX0ED6c
         fc+hjPcjYAF6eIoDOLs+fJfsUdZj2RQFuu5q39O6TSRorv8IkcLwydME79tk5/a+0W64
         0bFVhuX1NaXEUEE1lRK1DtCc1lh9GAlX3LOGVM4odDzyA7gSrDfwDCpMntfgaBEnSMzh
         4cyiPcEGGm0NGjoHGeQgTzzlxvHJPoIna1sMpPfdEWF1hoLeqAUqAuoG8fqUtPZpONkQ
         248spdbLTaIbio8ABFXV+rzlM5/sKxPIPIY4fIdMRs5NQ/7UhefIgAOHlUJ1Zx9/e6u2
         /U3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515492; x=1784120292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g3jhdMOgt2auKeqJZC2qsgnXeW6Etk1FtxDSQv7KpuI=;
        b=KGmVJuuOT1GAEB7mHcZDbQlMhWAjfjv8e2G40Hw+v7hUOl3t3xODwom13jwn1a+WnC
         eUDnXHzoq9eiPJQcf0AE5boPlzKl2F50bJdg72ZSvFcsNoLtDrS362Z1AmO9qcJUSxaW
         fahIrKFkTlGSl0OP8xJz1MQjukQ6Tf/631ycJ+c0UJ3jQOP0AeScH+bbvA/wCUKavw1D
         FZzTf/nG/II2VTDdUNqfeSbvmB0H7HitIl5Yjv2GMhtfa+YhmOVMwYfAFIIv5ravWljn
         qGT/GK/bZZQmOjOLksRTIoACnlFS8jhoa2n/Y/HVV7SKspN4FD+vEq9+8y/oNPvaMwBH
         UdDg==
X-Gm-Message-State: AOJu0Yx1kZn0cZ5Cnjkk06pJQqMD530xXeC5bGtyecV2hCNyeUvw/cd+
	t5hcO014GG3d3fnowJVsCN6UP4stb0qU/q5tG9ddyd1bsEVK3G1PVBuqovZedzly34EoSRtC5kN
	xsXPdZbteKBl++a5qG5ThBb/rtRb58V8E234LsoQ6KEvVw8YiAyA5TSAabQ==
X-Gm-Gg: AfdE7cmZxs2sfZMwrmuyB46e7JWCb8m+EhhLAqS2wwZu7jAVQ/3K09kvUOWjAcnq7BX
	i8DdE3GKTsZ0WTMaFTTDr1quOSPg4+yjmdyrKqB09R6ITJUByZp7JhX9FfDfLartaAnXs8n6Wp8
	+96xwfqpTnuVMDbcpyDwHciu7xwASDjLbuo6Vq6zxQDELRF1lfRodp+D05sz4kreKLwUKqNKlF7
	MGSIGC6uFKdtjGYh2CmiE8lhCgFgB+iZpU6YP9Fnw/qxLCKjuphOL4Hn0YBVrmHoFPaDB6h
X-Received: by 2002:a05:6808:221d:b0:487:61da:70fb with SMTP id
 5614622812f47-4a2021033dcmr2098773b6e.10.1783515491810; Wed, 08 Jul 2026
 05:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708-ccaione-genio-serial-aliases-v1-0-bf22229e9383@baylibre.com>
 <20260708-ccaione-genio-serial-aliases-v1-1-bf22229e9383@baylibre.com> <20260708112728.B36141F00A3A@smtp.kernel.org>
In-Reply-To: <20260708112728.B36141F00A3A@smtp.kernel.org>
From: Carlo Caione <ccaione@baylibre.com>
Date: Wed, 8 Jul 2026 14:58:01 +0200
X-Gm-Features: AUfX_my6OBZKWFOlZuKLzFJWZl41nIBGecHHeWzeLn71mq8QPAB-_oeroes61x8
Message-ID: <CADh8LscJzRdYOKER6=zS4f_0Sa7YhcU2sTTDswwdGMZe9LNERw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: alias all enabled serial ports
 on Genio boards
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 1:27=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Incomplete fix: mt8390-tungsten-smarc.dtsi leaves multiple enabl=
ed UARTs without aliases, remaining vulnerable to the console probe-deferra=
l race condition.
> --

Alright, let me double check if I missed any board. I'll eventually submit =
a V2.

--
Carlo Caione
