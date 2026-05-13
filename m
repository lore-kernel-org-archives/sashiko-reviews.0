Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76514CA276
	for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 16:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691524; cv=pass; b=TqADVHFjY1s3k0BNBTB6YdnXBbs5nSRs1X2fsyzSJgvupDZWX6qu2e5fMqYFTeV3tFLzXIYw/Go1wsjR1UZUrlg3p+t8h1YkXI58EUx/fE1pguaWRrSitgtCcL290JheNosX8yzDiuA2Sot34aAKcI6ijgH3ZIegtgXmEgTZmcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691524; c=relaxed/simple;
	bh=SqJkmzsxQ6Bg+3993aoSopYTOKABnIcT2B3LrMMerNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbqBSr/uzuK9eBC607du9wmy3QEe++No6OzLB2MCA9xwsdiLMkNREluHMnHibza0xcpTzcMQ/9PWSdI1hyyv/7WFzy7Y7ks3fmEIQo5Zazpgp2pT6p9qjIc9nx0+X6biO096BwTyIdJICuSCIwiWdOJAMa3rafWMb7SKNcLK+C8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfpfhEU8; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfpfhEU8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so44628615e9.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 09:58:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778691521; cv=none;
        d=google.com; s=arc-20240605;
        b=YHaUFi13ViQL+UKXSV1TGgXms9qu5TBeliVzWBEmC5vG3HmRvhYVcdUsn/y2drnZP8
         pXzyB4xPT+cOj6U1S2pZtiE6SsuvpLtD4OI10De13ysuPjHUs8HGTTzMeCHdfSwpFo+B
         N9QI6nlH851UuDvaD4uZNyfFmNUyZCbJ+fL4Ou0p4tc6zGOtQ2cHN9cUrjfNpgv5k8m6
         jJ6ysxc9zBM4T5/awJXWztVq54c6g0Dzh32JqBAPOomXivZjSvbAgC8KFzN9Iv1tpTRz
         n0Xjtj6CytxEByYdqPcQ7omBVILLejexi/Bjav9sqawzdz5PObHmI+GE7h7iszOhSYFt
         ualQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cYn39bxkUPJdxPW/51bsLAUNQTX3vZyidzaMcAYM4Ro=;
        fh=KeJufwMIREYvL08VN3hv4ACWs8Jc6TJ2nFmBL1zkymg=;
        b=GEXJJ7/SrxXsDcagoH4EvsK0mapF/RQz5VGp/D8g2otK8wYg4BBF/ppRB+wQt+ZkMm
         lxQL6qhw8b4bXJ4LbjYwvgDGjpTc08WAOk0lZvCObfNe8qrvYsHN2/1DtjHxNhO7oo6t
         TjKUazqujMbwsi1f+qOyM6nIFKlJDzMz5nSnBR61lA8W9ZsPiqbzxeVRRAR9FpcRa4hC
         lnNzfDcAsQ2M7rbPkzxZmUs9yk9YdHHEDCKkr5DXp1o/zt5Jk9rvYn9ovXgT3zA1NWo1
         Z0k6kargUeBzI7Q8Rc2ACGOmpzbsYK8GvoQj58mdXZnD/jwYgxAeuIU7skCuaPbbYivg
         0CmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778691521; x=1779296321; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYn39bxkUPJdxPW/51bsLAUNQTX3vZyidzaMcAYM4Ro=;
        b=dfpfhEU8KgTe7B+tZyz6cwVvb6jszS2u1ZWNrgFM3gyNmLi73Em/v++2STRLAuN55i
         yOsWCdRNsNqFZBUwoBWrEIJdmyxarQnGDBrQq+5lbkBKditTfkF2CsRR6ipNQ0zs2wuk
         iHwDjgPPUpJt1yvYyGAqPR1Y9eN1YQ57glVNmGbtNcndENbcch4em/ugAKyFq1xQvyZb
         DsQ6qtqMWDP40CBuCsUX8LRow3xBz5U+lYCZ/lvsU+qSrkDviE7pMtFdLPwroFo9dVd7
         kt+dYhv/74rz0OFqQgwim8XS/kN1MRac/muS3lZTVwaFsEhH4L1odHI+Ohqb/YQPIPU5
         Du8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778691521; x=1779296321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cYn39bxkUPJdxPW/51bsLAUNQTX3vZyidzaMcAYM4Ro=;
        b=oZhu9t8K7WGaDHtKMX6sWU98At3ME2HvUZNK6p9L4zOBY3BZsuaUm902gAJwB/RRpD
         uXW+DnWBtUZiPwNRWdu9m3OpyN5L+b+scXexaWUSgXaTMseZVlPCJ/X8MAqWDnwtlfli
         CO++ZHSXZIweJdHzoDPIQaLmIv5eRvAhCmVlbTVVHvR+SHhO4gEI8uGI/BdQaMvBCpnk
         8TksU2qleNwxqw4FyuAyjcr2T5zR3qo6rAzVGwG2FoJasT4j0PeLEwLOfgDvAeNU1+jX
         JdLYX23ArY2Ma7NhpW5lpeOjnxTKM1s34rQi8Xn3D7Q6XGiPNyTSjFycFGvoEFtLyIJe
         HdtQ==
X-Gm-Message-State: AOJu0YyqU9V1wT9pS2eJLG6y207PBdWbaX9qxKU5xKaU6WEoqtGR7Olr
	7jP6X5QYpAeByRypXtADG30kdt7SxXfvLvvKgTXEwXwMg4bHVCVO558qHqJjgANUuDPAnIsJRmH
	bXH0p5ZZtmbmj79UBlBxZRFZ1/QbJT/k=
X-Gm-Gg: Acq92OGP1gEYeEQC5Rq9Q8mtFN+ZqfhFZZVnWA9Ct57R61qe71fxv/73/wecMrmKWwI
	YL5sE4wc4byysQJGV1D5stXA5xzZ0dhheywAFgXiwSAX6Hj20OtNHIKfKYsZP1EExw+LzBHCU38
	VNUPSQgww5n601t6ofQEMQ9uIu2UswYtnWELHLhQFndkB7Un35ekogH22rIVsvcu5H2lVka/9lM
	94mctXJWQULwNYu8ii+2gZq3gw+APLt/PGkzXR1CkcJoahZ4h0jtsoVJVLnS0JWu6acq/thWfYW
	pEKqrB+UsG4+T2Iyckxbhcv/5yj3WVqgRN45nkrbMClxGIDv/DOQMt/OJFCrbiI8hoZUF+I2CfR
	tfsIdoDChBgd/Y6yX4UP6DzPYVw==
X-Received: by 2002:a05:600c:570a:b0:48f:c649:e6fa with SMTP id
 5b1f17b1804b1-48fd636a2f4mr3781615e9.15.1778691521043; Wed, 13 May 2026
 09:58:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511152817.89191-9-leon.hwang@linux.dev> <20260513003358.55836C2BCB0@smtp.kernel.org>
 <b22790b4-1e33-4cab-bc2f-92cf7fd60bfd@linux.dev>
In-Reply-To: <b22790b4-1e33-4cab-bc2f-92cf7fd60bfd@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 13 May 2026 09:58:30 -0700
X-Gm-Features: AVHnY4KVmxpLGhSwu1nYRAjRitowA6SWqDXC6Ub7AkvvxHCT8-OofyNdXkODyIo
Message-ID: <CAADnVQJk4WRFrwfNAgmFSbS1AgBHUok48ArU08SwSn32GNwbWQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v13 8/8] selftests/bpf: Add tests to verify map
 create failure log
To: Leon Hwang <leon.hwang@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 3:47=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> On 13/5/26 08:33, sashiko-bot@kernel.org wrote:
> [...]
> >> +static void test_invalid_numa_node(void)
> >> +{
> >> +    const char *msg =3D "Invalid numa_node.\n";
> >> +    LIBBPF_OPTS(bpf_map_create_opts, opts,
> >> +                .map_flags =3D BPF_F_NUMA_NODE,
> >> +                .numa_node =3D 0xFF,
> >
> > Is it possible for this test to fail spuriously on large systems? If th=
e
> > test runs on a machine with 256 or more NUMA nodes where node 255 is
> > online, the kernel validation will pass.
> >
> > The map creation might then fail for another reason, skipping the expec=
ted
> > log message and causing the test to fail.
> >
> > Would a value like 0xFFFFFFFE (avoiding NUMA_NO_NODE) be more reliable =
to
> > ensure it exceeds nr_node_ids?
> >
>
> Practically, NUMA nodes number wouldn't be >=3D255.
>
> Instead of 0xFFFFFFFE, better to get possible numa node number from
> /sys/devices/system/node/possible, like libbpf_num_possible_cpus() to
> get possible cpu number.

Ignore this bit. There won't be such numa nodes any time soon.
