Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FCE348C70
	for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 16:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781280272; cv=none; b=QO2bw9/4NmLTvrkgVd0j6hjfMuPzvI8ZU4ln5gtqME6gVregEqKFnrBeHMYYAL3Wa1IMoLkqAOL+cjLXWmkTE4TytWTtb1M1m0s9fP6lxN48ABSDcVZDuoa5ETzZt/BQGrWjbTdA8qH3WghcrtQ8oowcb8Ep+IRH4ZA0GXtA9Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781280272; c=relaxed/simple;
	bh=Dgq0d5IxI7LC/ibes1FpOx3wjjhpIMfmAGq0LmAr+jg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XNn+nr1wLhL9tEiNv/S3H025VbH9xQcyBjDnDsegt+nKNf2t77inyuzfUnzKny8n91ye6Vvvq6/jVx34PEP5u4cWSmZD4LjpjjHue8eeVbUukr0ep0rseezmfMTxzjnafWTzZPrEKw0D4i2G+gq2OihSaBNi05lypmySxlZfmgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcPF9O7w; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcPF9O7w"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-440f9c48b85so934240fac.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 09:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781280270; x=1781885070; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKS75dTi+dzJ2YpMpG0rfsRbp0U/xYE/c1D9hfWBrtc=;
        b=pcPF9O7w60plhDbWt7hEH4D/pZUviC+bRRfoY5CNUTUBlxN1bQmVSho3lHmJ9sxbAS
         Hlxjp6VPdsqPVy5OvwWZKMq07l60WH1PnV5HfSHv2ODa9Ng2WWILfP5DMqlD9JPV9j9s
         lw31wvgGQrwn5De/lCVXtC9yRCIHa5UDIAH1TzJ9DAMxppXNBveJ3aa7Z16DDIxI8vZV
         teSenrpsh56AcNv4CzZOFA8OqgOvn3EfKh9tL0/eD9iavlUP491GW9bLoaa62gavhdIi
         pBNhjHdQ7yv5G305eCAEePCfaNtN98RgFHAfpAtDoaKXksQO1jWiJs6SiDA+Ve1+Htdb
         dWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781280270; x=1781885070;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sKS75dTi+dzJ2YpMpG0rfsRbp0U/xYE/c1D9hfWBrtc=;
        b=CwsttkiLJGtnXjlByMmycWnwatZhsARn7Fyv3Nkh9NTApQp+WKRWHcdmlX7z0rGRh5
         MCjo7GOt3GMANNHiuBbJyXfi/Fn36JLveihMcVwBJhoaBCEa9dFw5Sq2NcjH+bhv3rVc
         P0DRkZjhgUaR6zF01vIUiezJAfYPjXwABFiwZ/A2sXI9rTDlrCxfQQNxoll0A5zo/9XS
         90L4uvgsqs+MiF1714sIYAq7eKR0V+vuM+ivuxt4B6nWTqGqGo09NPsq2vIvckF+WlfP
         yA0qXc0PRR0NwAel5EAJJLM44uBrOaV7MSmyslRiREFdorYgbJG9WnGxFW7wnstjSh9L
         +yWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/kU759PutvSKDj2tlJmyZLbki9Se2RYpSKRCR6PCwMKh1kVCpgqyMdLxNMQ57ejO4KlXohlVM6W3YR22bUFQM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBchsSeAc43nSTwaXExZn/HyJvlrlpbxqYtX3LRcMrvgiaXsGv
	g5K5edUAnJ/0AGDDQkbgyHixtu+DcHS83rc/i8FyaZebnc4T9kmlwb3k
X-Gm-Gg: Acq92OF6LyHfNaReBc6bC71szZl6ReMRfU5WXPPKY4tS6EEBNx5hrS3V/Dp7rZDXQ5B
	2idewCW6VZIMTbbAbjPIvLKz2sbLEQBZrBlDb7C5Oq3GfrWCmPSKa2Vc1j7qV6CQbK9YPCjYPAL
	E3Sd2N4SnX9aQx9dGOfTQjf0MSEaB2RfG/DhXPf1HhbCgS5AiGAXtNhQ0dYT5yijJuCzn3p78Xf
	/OM0Xa79rGv5HxLHUzPaF6x4Jo2Siv+oaptVwYPy6Owj+m/qqu05yfPjb8uUQME7rR8bXOslMQM
	/b235VJwjxkwkEx0NtizyRkqh83j7OXpL/Z79azLc6zWGCChFjHoognCwkXiu+FknSaOWI7/h0e
	OctHdla9q0SmUrZ/b8uNoX20rdV4IhRs5u+U8WpEbRE2hGVY582Tp8HLR3JBEX48s1x43zHqXKH
	zj8Bh6XD5T6juunkNjUh58EcTqrP1oGF+jKGUF1h9pamEq8OgVvrJWHeuIN2AlBK8eML1llDqly
	haheKC08ATR2U2bdQ==
X-Received: by 2002:a05:6870:7124:b0:433:cb0d:7702 with SMTP id 586e51a60fabf-4426ee46ademr1365648fac.13.1781280269446;
        Fri, 12 Jun 2026 09:04:29 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:4d::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4426abf260dsm2047439fac.6.2026.06.12.09.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 09:04:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 09:04:28 -0700
Message-Id: <DJ775MFSG561.2SI6FNLLV8NG5@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH v1 bpf-next/net 5/5] selftest: bpf: Add test for
 hwtstamp proxy.
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Kuniyuki Iwashima" <kuniyu@google.com>,
 <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc
References: <20260612001803.23341-6-kuniyu@google.com>
 <20260612003138.E67A01F00A3A@smtp.kernel.org>
 <CAAVpQUCRU1ie22PbegWgGnfyWw9V0wSTjgQpw=5Wwb2RZ=su+w@mail.gmail.com>
In-Reply-To: <CAAVpQUCRU1ie22PbegWgGnfyWw9V0wSTjgQpw=5Wwb2RZ=su+w@mail.gmail.com>

On Thu Jun 11, 2026 at 11:03 PM PDT, Kuniyuki Iwashima wrote:
> On Thu, Jun 11, 2026 at 5:31=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 5 potential iss=
ue(s) to consider:
>> - [High] Comparing a potentially negative return value to `sizeof()` cau=
ses failure handling to be skipped, erroneously dropping packets.
>> - [Medium] Incorrect struct cast for SO_TIMESTAMPING_NEW cmsg data cause=
s test failures on 32-bit systems.
>> - [Medium] Typo in the test assertion prevents verification of TX timest=
amp keys.
>> - [Low] Multi-line comments violate the BPF subsystem comment style.
>> - [Low] The `buf_cmsg` array is not fully initialized before being passe=
d to `sendmsg()`, passing uninitialized stack data to the kernel.
>> --
>>
>> commit e747f30190af013f6f5cc858f0dacb86e902e2d2
>> Author: Kuniyuki Iwashima <kuniyu@google.com>
>>
>> selftest: bpf: Add test for hwtstamp proxy.
>>
>> This selftest simulates the hardware timestamp proxy scenario using two
>> UDP sockets, simulating a userspace proxy via a GENEVE device.
>>
>> > diff --git a/tools/testing/selftests/bpf/prog_tests/proxy_hwtstamp.c b=
/tools/testing/selftests/bpf/prog_tests/proxy_hwtstamp.c
>> > new file mode 100644
>> > index 0000000000000..d0f90f22bea22
>> > --- /dev/null
>> > +++ b/tools/testing/selftests/bpf/prog_tests/proxy_hwtstamp.c
>> [ ... ]
>> > +char *ipv4_commands[] =3D {
>> > +     "ip link set dev lo up",
>> > +     "ip link add geneve0 type geneve local " APP_SRC_IPV4 " external=
",
>> > +     "ip addr add " APP_SRC_IPV4 "/24 dev geneve0",
>> > +     "ip link set dev geneve0 address aa:bb:cc:dd:ee:ff",
>> > +     "ip link set dev geneve0 up",
>> > +     "ip route add " APP_DST_IPV4 "/32 dev geneve0",
>> > +     /* We do not forward ARP to the wire in this test,
>> > +      * so a static neighbour entry is needed for APP_DST_IPV4.
>> > +      */
>>
>> [Severity: Low]
>> Does this multi-line comment format violate the BPF subsystem comment st=
yle?
>> It seems the subsystem guidelines prefer the opening /* on its own line =
for
>> multi-line comments.
>
> Gray zone, this is rather net one :)

bot is correct on this one :) BPF prefers normal kernel coding style.
