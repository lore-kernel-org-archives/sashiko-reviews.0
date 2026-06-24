Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E485540D56B
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 16:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782317912; cv=pass; b=Dk4ThrAIZbHCSvcD3qDr7Wg6RfFrOYjEUPlpzOf64X2CLTCiUI1fY5FXNNUn/rcJCnGyTbdTS/40nL8Texa/uKfOJRoyx9ST2kVMEr84+ORUBk7y2JCeWtX0rl7y1tg2JiZp1kgr4S3/88/yJ+L6jAs/3kOrVc6a7NyONBLaMR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782317912; c=relaxed/simple;
	bh=zUzopiKicuC5Fqd4Gkba9vCqksPM8i7r+cVH5ixZYM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kObVrUd++6AqC0ncQjuxgl3wunMzQEfS0BWNS1dyQnnV6w+5SgXOSPTKirVaaIPvUzyRiybIKbQbbKHlZTIZO589S35Mq8F82o3Bo1yCn6EPFLvdHlWNszNbjNF8sgUlKk8En4DM00KtqAszj5dz/zz3Ga/GG8ZuQrUySCcb454=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cPAFDP5+; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cPAFDP5+"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51765331535so298221cf.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 09:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782317910; cv=none;
        d=google.com; s=arc-20260327;
        b=qvuoZ/1S4/nbkYCYCqHDpHlR12cWOjuOqphZyrTAIvv/tLoZcvZdHG0AB+W/Lh1wtF
         1TSgrsJFKYr6ocZJ0lxHnsIBa7m00rftYipB+p0kIJakIJ1OkqaCiATZe1WvzMtODNKh
         ergcNk+XT5RV/o9MKS+VEtq0qDZGqiT17j3CRo6a93IUP9wSaoP//n18yMVhRCIjYK0A
         9gGsFnrBIdaBodoZfS6o915PAqtvE811OfKzM3VwxN8tWNUoh4TPYQ1DSdfA8a1rMuCr
         ur6easmTpmCXqnrb8YjbUYFEiKrTBhfQdGXeZX9Gy+BdZSxgpgn8/uLR6I9/kkSZWI0T
         zRCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zUzopiKicuC5Fqd4Gkba9vCqksPM8i7r+cVH5ixZYM8=;
        fh=HeZq/BZlSqOly4zaYMvd1hgqD+co6dD/cualL20780g=;
        b=gz1KXQSOa1Re8R8G6pFX6fUbd2KasmAPruvpS7UpmUZa3VFLhLWsGlZKHDEanqJ14l
         z05rlWPlMpBHbkvakeaMguI833qfHHM5E1g/iKITPHuEDp3bA+XDZ5GUrkV0iFuXP+DE
         GnB/Wo6sX5rjp9syqLgASHXpKeWfivqch6McUCB62bmWZRY7yJS5JlvTqA6Fne8VI1K2
         lXA7rbEuqDW1WeFFWqU/SzbqLlVtshhv/snqT0pAJDtW1f3bYhKW988i7yFPxn25uPoW
         XHhGc0kCRUOYAVuEUkK2tN/ms/ln9npujzkDqdHmv5pL/ergwH55Lq5xLGU1NH8gFNII
         LLMw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782317910; x=1782922710; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zUzopiKicuC5Fqd4Gkba9vCqksPM8i7r+cVH5ixZYM8=;
        b=cPAFDP5+X8dgTm6o/iwXEMIc+YRKXN2m+bqzsn2TQztrs29Pcbkc1AVVwAe3KrwAo1
         vs3PR89p6X//EpE8RSrcCq2qfF3l3KP6Oh2dnGX06vLCqRg+N4gIBEUCiDxiIiJZfbsU
         i+7agWS7i4fr5VVNSDpIdVPfpN4BSsbkAZoAtXEIQF6v/aMgTuSodSBIlwWYshpcbSpC
         lKbJoRlV2UrtO6AaJGmwkVg4gzfCmpcpq38EmMYV88QF6oYbbVnZRociwoW2rPiZe+Bv
         ST9k04iVo945uNJYd8q4a76wBNxuLQKRSluIxnUj0hALZtmPUNDbqmS2if0dY9dhIKv1
         nISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782317910; x=1782922710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zUzopiKicuC5Fqd4Gkba9vCqksPM8i7r+cVH5ixZYM8=;
        b=Aoqbr5+zTSr/cgvWjsyXVr+t/H72LyyaPsJL2CxMANOh09kRaGbcuOgI+j1lPCfk1Z
         fR7oZSkikrWVdXIg04BK9ciDqaRQ4rU3LPKQgLtIjR8lO4+75GfkaxoZmrjr6DDAMB4P
         Zyw6DtprCNlIoxf1woxbnATGFy/7lby50qtfAQ3q+/mx8NrDRYtrUqagHG7kv5U8R2tm
         Xu23u2+aZ6eNy21nO9R+Vm08TXz1sr330eoqErfKojX0xYcVj/NSvSQg1BiD+kRp2djq
         r/+VJMxfi6QyMDC3/qdtzsioXFYT4XY2oyILJuIaU0xaLnfQXIAcCFrN9JHiX83nYig/
         zhGg==
X-Gm-Message-State: AOJu0Yx4dbdUNoU4FYD69K9ED+oAtLtrVAw17//p1glatFf0F3qvA+Ed
	53+Y3kyDAMj0RfxHvLtxEIfnxUZy/uP6w+ah2JoqnaCUf7Ekc2AMJZ6Kuc32rCcvf80OFPfJA9K
	4ew81XdFbrI5SW5STX5VzDdnIztMO2rf9xqsSu7U7K5t/IE76Ks6CT+blDrI=
X-Gm-Gg: AfdE7cnpAmMXAZ7BXFHMKqvO/oJrJl9l2aBabYpbzPJjUSNNrV77jTYcfYvBMhxWJji
	KDONIyf2j0OVGRdZg8jqwOo8UV0rThAimYwgQ11QxOZ+i3eeJPCw5FnxhLVVeY5zmT/wpTXhWCf
	SM1uBSbNykIrcX92kc6JNmtyv4FQIzMsy8V9naHj6PYuOIdQEMjWU9LYDD5IjfNPab/a4lLJ6D0
	gE6EP2/YYqSUDXEj62YSZ+L0SMe8kkzX9EDQNeT+8WE3SvgQLOVkvhs3qe6oglGHtBLujKLHfCC
	2I3UHR+B/u+8se9JoFjv1DZNVuQ=
X-Received: by 2002:a05:622a:a0b:b0:4f3:5475:6b10 with SMTP id
 d75a77b69052e-51a61625805mr11966391cf.8.1782317909222; Wed, 24 Jun 2026
 09:18:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260622-alloc-trylock-v2-0-31f31367d420@google.com>
 <20260622-alloc-trylock-v2-9-31f31367d420@google.com> <20260622101153.C08741F000E9@smtp.kernel.org>
 <DJFI52XOQEPO.AH00UF550LWN@linux.dev>
In-Reply-To: <DJFI52XOQEPO.AH00UF550LWN@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 24 Jun 2026 09:18:18 -0700
X-Gm-Features: AVVi8CdR2pEHyIYJlmDEUnh8LBalNmsNXE7tWkeb0ZhZjkyemuK1PyvVX2BgBpM
Message-ID: <CAJuCfpFERZ3ohA8uQt7BBPocWDAn-3P=RVqcA08U9DvWRWwERg@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] net/funeth: Switch to higher-level allocator
To: Brendan Jackman <brendan.jackman@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, Brendan Jackman <jackmanb@google.com>, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 3:22=E2=80=AFAM Brendan Jackman
<brendan.jackman@linux.dev> wrote:
>
> On Mon Jun 22, 2026 at 10:11 AM UTC, sashiko-bot wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] The commit message logic regarding __alloc_pages_node and al=
loc_pages_node is inverted.
> > --
> >
> > commit ab883602f87dc726f65726ac01fce73a498907b3
> > Author: Brendan Jackman <jackmanb@google.com>
> >
> > net/funeth: Switch to higher-level allocator
> >
> > This commit replaces __alloc_pages_node() with alloc_pages_node() in th=
e
> > funeth driver.
> >
> >> The difference between __alloc_pages_node() and alloc_pages_node() is
> >> that the former allows you to pass NUMA_NO_NODE.
> >>
> >> The former is going away and the latter works fine here so switch over=
.
> >
> > [Severity: Medium]
> > Is this description inverted? Looking at include/linux/gfp.h, it is
> > alloc_pages_node() that safely handles passing NUMA_NO_NODE by checking
> > if (nid =3D=3D NUMA_NO_NODE). On the other hand, __alloc_pages_node() c=
ontains a
> > VM_BUG_ON() which strictly prevents passing NUMA_NO_NODE (-1).
> >
> > The code change itself appears correct since the node variable can be -=
1 here,
> > but could the commit message be updated to accurately reflect which fun=
ction
> > handles NUMA_NO_NODE?

After fixing the changelogs and titles as suggested in [1], feel free
to add my Reviewed-by to all the patches replacing
__alloc_pages_node() with alloc_pages_node()

[1] https://lore.kernel.org/all/20260622-alloc-trylock-v2-6-31f31367d420@go=
ogle.com/

>
>
> Repeating myself[0] as this patch has a different CC list from the others=
:
>
> Sashiko is correct, the commit message says "former" but it should say
> "latter".
>
> [0] https://lore.kernel.org/all/DJFI39RWHV1O.MMMMMZSK8E8C@linux.dev/
>
