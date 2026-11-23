Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795440551;
	b=2hB83EZU9K+yh3QGrg+xXl6bSsCY2ja2/TPwNB2q6znzWclMBH3w0n15ru/+oArtPLAB
	 mW9GgRIxjJESYrYrV/IJL50rQxB0xdrnwFT4AT9jPmvlIxKeKJvlF2ZVWgctq3tN75Jvq
	 9mIaAtaoGnccafopwAJAHsR3RJ+yS/Go1VSlHssv7HRhGbCpizsBnjlTl7NXBH0btpn1A
	 kWaMFTQJi+aUYZteJoaNYXkAKovnEiGvU/5tSYFAEyAWiFs4ZjeTEmr3UD8BPpQ3TTU5v
	 5cxGK8e/l96j1grdm3XB3aiKgHfIJ6VwprVDe+MYOGkYNohSWZxtg4RYiLUKfhC8XiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=5P0SfAg0RNgf//T93vMcvwfndd3128+sOIInvKqWpbA=;
	b=tvWj0N6LHCyttWcptnrE1B0fkt9VFpOXWJ7wphKsAIzUGzrtwkqYH4vLDA44PeRqOVRr
	 mallM+Gu4hsuCITKs/0gsmSD9LqeVTmnxi3fbhExay3zsWeXrbg4N3cStrfj5+Mlt0dFR
	 u2zOzf9ORxLvQcf6RUqdWMczbDtrM4MCb4zvkCoL8wyZFbSHdJhiHKTfGk7gjG88NIJbz
	 IgO1bMrs+j1e5y0d5moCKiI1eAINNFDuDBwI8XEPSBSc6d2ZaHrRy6eHmtm1sIcfxOzfK
	 dN/YXl1hDUtIsYEzzukq2vsaIIakEN6mOo0IFjFgytnr06EX1VGhvHRyrhjsiDmHrGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gMHY/VU5";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9991F606A31E
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 13:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9991F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gMHY/VU5
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c1acfdb638so226206e87.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 05:29:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795440550; cv=none;
        d=google.com; s=arc-20260327;
        b=BehuzgHSjKcqvKqc5kd8TvuuzeR0rgqm62+db7ma36ECP3p6AQ9Q0yrJNXILunEsQ0
         vvXVL/Ipz0xR5u//mCSFvjwm3WbAlkNWk4WHfjymor0pExzpEDn6kMSJ2f1rwCH6hhL3
         gzgxkvVPhczmi5cxcZJG6V/NsJHiET6+6SzpIANX1AbotuKU6FDLrBbUFeFmXgr7hF6g
         HcdErWCNCLv2TkdF3HmzLh7A1hv+bT3PJossyHQEckdsaKlvPBhHL34N6WaUXw1BtJ5W
         VtW2YhKv4zTsGsFif/90lhIYJf3Uz+75i1b3DEtsaYNILV9hdGVqfFQ5gPDdHk9ujSuQ
         2hQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5P0SfAg0RNgf//T93vMcvwfndd3128+sOIInvKqWpbA=;
        fh=l//MMCGTUpekS9QWUMFLTH2K88VPAt16/s3GUXtrDZg=;
        b=Y8+qhotbU7h6W60+I8wpXVyzJDmEZGOk+1wv1RPmyioRJPzPyCZc/mv1jZOl42tLL2
         FgUnLHh/56aTEhzl3R8a2A3DMev81MZnAV7W+IlL7Oi4T6k1eENgq5wptdgvGKkJz/oF
         KU88ohaLjwvkENlaOXz2m0pSMCY2P6J3LYsjo5d2RKlt/rrzvaKsxlhoJL/KmqrgrN7g
         lIVHdQ5JMxOERkw6afLenCR2BFQC/vpa9nuC60aptY4vnRrt00Db3XbT3toobtr1LTQ7
         7aBXdZvRcP6dJh7l82AsklpOuPYyZe58Y7Flc8ehBomrxjO0bYk4+y46XsoAkDcUN84N
         +tng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440550; x=1796045350; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5P0SfAg0RNgf//T93vMcvwfndd3128+sOIInvKqWpbA=;
        b=gMHY/VU5Q0j8398NFrXg7JeKSSFLRf2zsl6Gq/sOeoA67/zkJtqaoQHzU6j/doqQDP
         WBoqLbey54ESdVPX0sWoQU6osngZfz1GA0gv9OSYOKvC7YfMFOJTORRaywB07xjnuOg5
         yZljFJfFwttqw5bpN9jWqLcP1fOtkuU0l6Ku+UdYpfk0NWHJeyA/vX7R6yfeH3P9S9ZS
         99hn1yaVSwYPeTPGM7DYEXIKaHofeyDn0wOtz9UVfPskZQmI87kcCQaN+Hgsp5dDCj3/
         IuxOc/sY9T6XVT1z6ppcEHV/0BroA3qfpI3WF+qkmbQkeZlhkNYnupUKLMlR0RZ72K5p
         tqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440550; x=1796045350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5P0SfAg0RNgf//T93vMcvwfndd3128+sOIInvKqWpbA=;
        b=j9onxy4eHv6g31SnAae4QVUsh5VPKzJsqpaYklEuCvQ42mep69d7ospNuhJ9YiqMaz
         DQOuKEde1Err73qeHsr9fSnXC2ETWYdWA3xb1QkEsgRMPbbMgql7FUZWh18T/B4lyy4/
         YfDXQXwrCcr93WEnCepURlIT+c10pH+t+yZ0UQUhz1693w0PHlGDAUG8q2GCLLUBzUoD
         Lyz4LBSgjnKX5nt+AZjC/7FRWljcaSvTa4CWRCD11WvJ+lnHCQhxnD9vnv8esbiI7B9i
         mut1u8DAzM6tOpJmqP/oghpYV8mDnchElVhYGi/lOAhSgy1SadiOmj9zmCxlCcVEbD1E
         tl/Q==
X-Gm-Message-State: APuU4Z9SW8rudvMM+b0/5oTHHBRGSjVjbDKY7zydXiMlkyZNEpV12+hJ
	gT1jKZWljoVJyRYVpDSUh7mqxs/EbB4TOVdXYPudby04iw3pFC3xHWxuoEVN6u+LuFCWzEkzgsr
	hX46F1FPiYOmNTeAUeAKNzTogCNuGi8W/kPdn
X-Gm-Gg: AZFdTZfj8CiV13x+5jgN1g1gVvcGHPQNvnWtVUzMjMcwwUUIfO4bbjxXjWyygGfWU+E
	vPpRDiSVgGjPXl/3Gy720+quJDeLhE8uK0ZzyAmza28p80O2Ci9QTILf4+7OvPZZjQnV8MJF+09
	jZDazyRsDtxCALa7s2N3wH+bZyxWsclS10ssWEXfQKfo6JfIu/lxA2VxZ3MFr3KYqbLI3zt/zrD
	gMPp+Lpr+pTGRVfiih150v6PKJ9nLCx5Hn3VRiuO9h9pQsI2VPCZ7JMkDMB9oLOKUUWzf1LdnIx
	K9rSk3udMYw5sStaLFgmObFKruWIBJJXmfVJu41KzunWrXglhGJqhEGzzDjJXHMYKBzvNjLFGxv
	oi7AFHQrJjbXeCpyH059OJ/74C8t/HPuTljl/Gmrly/h+STxG+GFPsWAUeKHBvY6Vo0zMADmB2D
	sWdkVBvC9qfxL9qJb7ET1EVxbiISNhUMu+6f3LEe7Sh36QAa1HPs7kTJsaMRzLEVNpANSCc/EHF
	6nohssxa3vFMKyh3CiKTMxE0jRDzSe91BXCSt3pMKKRc5hZrpa1MeGYSEQm3x4Mnfz5Vpt1
X-Received: by 2002:a05:6512:6718:b0:5c1:57b6:c731 with SMTP id
 2adb3069b0e04-5c1bc55528amr2860372e87.0.1795440549518; Mon, 23 Nov 2026
 05:29:09 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
 <20261104-build-speedup-v5-2-0f6018be8dae@kernel.org> <sashiko-outbox-199744@kernel.org>
In-Reply-To: <sashiko-outbox-199744@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Nov 2026 14:28:57 +0100
X-Gm-Features: Aa3M54p2MuaVPrel21pLHhiv7_UQjxDcbruYJqUL7bjr4LeGvFh_ddwRm4qiHrQ
Message-ID: <CANiq72m57kFE5LTjT6V0Vajbwv_oPFEVwkBWgp5B2Xhh1E9uFg@mail.gmail.com>
Subject: Re: [PATCH v5 02/11] kbuild: implement and use depcheck to check
 dependency timestamps
To: sashiko-reviews@lists.linux.dev
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kbuild@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 7:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> - [Medium] kbuild: missing fixdep prerequisite for depcheck in scripts/ba=
sic/Makefile
> - [Medium] kbuild: concurrent Makefile.build runs race on .depcheck.mk.tm=
p and .depcheck.mk

I have been using some of the patches of this series for something
else, and I have been hitting these two issues that Sashiko mentions.

For the first one, e.g. `olddefconfig` in a clean tree can give:

      HOSTCC  scripts/basic/depcheck
    /bin/sh: line 1: ./scripts/basic/fixdep: No such file or directory

The suggested prerequisite fixes it for me.

For the second one, e.g. `make -j4 rustdoc rusttest` runs two Make
instances on `rust/` in parallel. Most of the time one of them prints:

    rust/.depcheck.mk: No such file or directory

and sometimes the build fails:

    rust/.depcheck.mk:1: warning: NUL character seen; rest of line ignored
    [...]
    rust/.depcheck.mk:22: *** missing separator.  Stop.

I hope that helps!

Cheers,
Miguel
