Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DC13A1E69
	for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 12:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782650210; cv=pass; b=IadlimFxX5E+zMgzsDS15ruWWVsAIOdLkARFsqvoyg4wph+qYsuy6WH02h3iBqvSBLfAOqYzye5Ejt9j9+yRKOX8DUpgij5ZmMzuvbgyoQRyPZd87fxdbr9PfumtU+ZUm7aJgHp5KrDs+z+VELaU7gdcUDzAhLLlEZWyISFa6Yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782650210; c=relaxed/simple;
	bh=QT3KyRx/yYFX7YJbB0Phy/hJFhtSz/3fbeRsVp3f/3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZNtqfPi0CmzBcEwDozmbLYunVUIcGVUyYTph4HjAjhXrawg1H+zSWfin9IWxuqEN8yro1b6ly/UJuegbyjISQ/CM3tMT06vnWJmRLFQCEb6WcUfpqfzgObEnEQEeeKfv6CMs5Mp7kvxETNZxwK2Xjmr5MB3QuXpaXaiatqVqXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=jIxTJ1re; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="jIxTJ1re"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-664d910cc75so79032d50.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 05:36:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782650208; cv=none;
        d=google.com; s=arc-20260327;
        b=Bj3z1j2a9rPBASaS1lC4q4CXh9/57H3FPo3TObPsQyhHPOh6ssLSO08Whn7ZP47Wkp
         6L3z9t2T6wFIuNgom/icWTli8LXlx5EEY8r3mBnS8EiFZdAkYVg8P61EXYpEL8ZGy21q
         QL2pHx6teADLbp/WkLZoQQLCVZGBoyY/e5QIj+a62afYBU7quJFCW5LRZktD8FpEBVEL
         SX5Jgc7rwQTvKTX0yE3LT1oRVJm0i5JXa55iwVkTLlmKGu+v2tvH9rskYm6Bho2uWbti
         sRPQr/cXdXNa0xl7knDUrvsSC/tLMRfT2MS2NiQ31tCu4zd6D+dGgOUn0i0p5bycxX9i
         UqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vzP5f4zYs9UEe0wmc6361FiYfWw38ZSqAfPCOvm2SFQ=;
        fh=aqMxS9E53NE+iUAgfcQEIspTRHEdhwwI6iEOaoTTfuA=;
        b=S0m8BjK3HX0ZbH1j4k5MV4OQcfs1nxeSY1SPriIMn3zd9sujSIN/QVOK1j69HvHlD5
         +jYFHbRByJzkOGtW+0g35Ey3XbqNYVVI/188O5/XK70f4zhqy4/B6L24uQ2AULq0fT2y
         XNfFXdsM9Ex9lB89exsTD96ouICog8VCBrJyO457N58KUoC8oS4zhK0fvB55wUA6s14L
         LLH2nnp4Ex51rhkIbZsuCw0gHdrXo0MAWDcYFBRW2zzUqb9lcjdfteFad4Gbl1OIulv4
         tkT0r4UV2LU6I3EEdfPdv3PbYHOoBP/KenptaLqbncXDflm2yiquv9zkt4pfylE8F/JG
         4EwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1782650208; x=1783255008; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzP5f4zYs9UEe0wmc6361FiYfWw38ZSqAfPCOvm2SFQ=;
        b=jIxTJ1reMJPaJX8ojeJCv16JpMK2seHXpBUdjuc2Lvj/0bo3th0ZfTJ/UlxFUcacIn
         gR18po3cq7jaIQ/OuOaOWWoyfX7VxX/i0aGT57aPLbN1kSx4G6YAGMcwbY+fjzj1MlkE
         t5CGVlMe+cPc7pcmnt0e7h15u4/GEw2V97W2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782650208; x=1783255008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vzP5f4zYs9UEe0wmc6361FiYfWw38ZSqAfPCOvm2SFQ=;
        b=pH+JJ398uNRwgRvBoUWB2K4Mq9qkVqvxe783iikU9zCfpg1EDJuQmGs3TXQFzIwC2s
         +GtVjoN7Q/D6d4maKfHYldOrmlE25kSPPRY0lPePV9JcKZQR+yqazc539yyA656AD7eW
         v6LYzyvaFSamLnx+hiK27m0ddDTfvy3eTIoZFRwUPIn4JU0JWtklosAXhlq4de9XSmmj
         /mXPrElIpWG99cQZ+S+IzOBTEBm0lfsnU7Dt3X5ZiSn24THHbVK4Ahjee3S/7Iwj2BcF
         ep2+JExYsNRsLTVHc/shINRt7Rokc5xDrbiY3ZSqmzDVeNn3cDkCqvAqZnAbezvf5Abr
         K4SA==
X-Gm-Message-State: AOJu0YxTN33BqhmvJc8z7QfG48zEGHUqnV+geWYrk9dw67cM1fxZ5dL4
	pXAGjQBt5JDztpdAwDpSKH91X8cakSPi8NRpqUkywNSTw+Wr5hYdHxGyWLqZsSa2/8kzVW5jBun
	9dulPDUU0426IBaPq690nKZBN7/BMIpo5HMNzyrVKajvuqJocePs=
X-Gm-Gg: AfdE7cmRbgO5sKMkS6sXSvDXTUmq019WyfmN+WOlEWJ8osHIUCiID0JBDpTP2WcRut5
	C69BvyTxEjr/znpD4N6Ahc5IN9+44v1zWvPQFK7nJNdJ4z5Q8cKi5dcSTgZv5S+l8F3cQdSyhwE
	ikw2BYWLbD76lX4tapSLYEQf8eovpk+RXITNMl9qSxiXv6mCYzSBW4v5g4Ll3QuIx/tYqvBWRYg
	wHkdgYWsiv8KPP01AzswwSiEOP4ezQQyNw+LfZKEgVxIhuGoP/EC7UZrrUltqfL0nvbdHzSNUrN
	M8/Zqrzf
X-Received: by 2002:a05:690e:4508:10b0:660:5e32:b2a2 with SMTP id
 956f58d0204a3-66487e08811mr8856149d50.49.1782650207987; Sun, 28 Jun 2026
 05:36:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626165156.169012-1-jhs@mojatatu.com> <20260626165156.169012-4-jhs@mojatatu.com>
 <20260627165220.CA0CD1F000E9@smtp.kernel.org>
In-Reply-To: <20260627165220.CA0CD1F000E9@smtp.kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sun, 28 Jun 2026 08:36:36 -0400
X-Gm-Features: AVVi8CcMk-OTbWtGzb65ms48PIO_Ru3oLcwHNHpBqSVb0aZgtGM3z9o_xVpkdK0
Message-ID: <CAM0EoM=Sm82LdxrX-tckyxyGbNOawQ0DAXnEPowgyYVZbx=vqw@mail.gmail.com>
Subject: Re: [PATCH net 3/3] selftests/tc-testing: Verify bpf redirect on RED
 block with preceding clsact (egress) classifier
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, 
	Linux Kernel Network Developers <netdev@vger.kernel.org>, Victor Nogueira <victor@mojatatu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 27, 2026 at 12:52=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Hardcoded BPF object path 'action-ebpf' instead of using '$EBP=
FDIR/action-ebpf'.
> --
>
> commit f4ff308069725bd7a3b6c6f843ecb0fda5b73239
> Author: Victor Nogueira <victor@mojatatu.com>
>
> selftests/tc-testing: Verify bpf redirect on RED block with preceding cls=
act (egress) classifier
>
> This commit adds a test case to reproduce a NULL pointer dereference when=
 a
> bpf filter attached to a RED block (which uses shared blocks) returns
> TC_ACT_REDIRECT while a preceding clsact egress classifier is present. Th=
e
> issue stems from a stack-allocated bpf_net_context being torn down before
> tcf_qevent_handle() calls skb_do_redirect().
>
> > diff --git a/tools/testing/selftests/tc-testing/tc-tests/infra/qdiscs.j=
son b/tools/testing/selftests/tc-testing/tc-tests/infra/qdiscs.json
> > index a1f97a4b606e8..762f86ceab1cd 100644
> > --- a/tools/testing/selftests/tc-testing/tc-tests/infra/qdiscs.json
> > +++ b/tools/testing/selftests/tc-testing/tc-tests/infra/qdiscs.json
> [ ... ]
> > @@ -1540,5 +1540,37 @@
> [ ... ]
> > +    {
> > +        "id": "fb8d",
> > +        "name": "Verify bpf redirect on RED block with preceding clsac=
t (egress) classifier",
> > +        "category": [
> > +            "qdisc",
> > +            "red",
> > +            "qevent",
> > +            "clsact"
> > +        ],
> > +        "plugins": {
> > +            "requires": "nsPlugin"
> > +        },
> > +        "setup": [
> > +            "$IP addr add 10.10.10.1/24 dev $DUMMY",
> > +            "$IP neigh add 10.10.10.2 lladdr 02:00:00:00:00:01 dev $DU=
MMY nud permanent",
> > +            "$TC qdisc add dev $DUMMY handle 1: root tbf rate 1Mbit bu=
rst 10K limit 1M",
> > +            "$TC qdisc add dev $DUMMY parent 1:1 handle 11: red limit =
1M avpkt 1400 probability 1 burst 38 harddrop min 30000 max 30001 qevent ea=
rly_drop block 10",
> > +            "$TC qdisc add dev $DUMMY clsact",
> > +            "$TC filter add dev $DUMMY egress protocol ip prio 1 match=
all action gact pass",
> > +            "$TC filter add block 10 protocol ip prio 1 matchall actio=
n bpf obj action-ebpf sec action-redirect"
>
> [Severity: Medium]
> In the setup block for "Verify bpf redirect on RED block with preceding c=
lsact
> (egress) classifier", will this test fail with a file-not-found error whe=
n
> the tdc.py runner is executed in an out-of-tree build environment or with=
 a
> customized $EBPFDIR?
>
> Should this path be updated to use $EBPFDIR/action-ebpf instead of the
> hardcoded action-ebpf so it aligns with other tests in the suite and find=
s
> the BPF object correctly?

The $EBPFDIR issue seems to be legit. Victor?

cheers,
jamal

> > +        ],
> > +        "cmdUnderTest": "bash -c 'data=3D$(head -c 1400 /dev/zero | tr=
 \"\\0\" \"x\"); exec 3>/dev/udp/10.10.10.2/12345; for i in $(seq 1 8000); =
do printf \"%s\" \"$data\" >&3; done; exit 0'",
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626165156.16=
9012-1-jhs@mojatatu.com?part=3D3
