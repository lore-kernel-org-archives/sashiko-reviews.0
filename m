Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041B927AC45
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 23:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788477432; cv=none; b=QnEZiGuJJcTX11MXI0heEFzDX0LWCb1BUs8lM/ubVQ7Qj2w2NeN51Wyx/gei09D6Q1HKc2on3uPBCkAfq/aNqwWJ6f+Tt1iELusl7GUwG/Mzer5QLsSceuCQ/Y52q1h1PoLKZ8XRCGILFLot3pYwUihb5Ak2LGFiKL4Z2yVhhMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788477432; c=relaxed/simple;
	bh=+igPmhB4JZnhVi+AuH5ZLh5CLwIPBTL7fVZk+I2KhiE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Rrky8SHWgWCL+RxYvcZ+IhTlzd747UzFey4ALunND93jjv/eDJAkMhKqsSGke7oHghdr2S8JZ1/zSp1/5f2hDAQYXISf6tic2+ZQA9fwYQ4n9838po31AiIZyXGkJ+pCMdRg6HqF9NbsO4QuwjXOM0JHrURepQeR495OxRKyIfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=IgKKjaKg; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="IgKKjaKg"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so467893a91.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 03 Sep 2026 16:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1788477430; x=1789082230; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rluHoATEsnIMMq1IqBSZ7wntCIrn2An5Y5Re4FkkfJs=;
        b=IgKKjaKgeOoTuqtDvsd1lqmcvJlZ3oV8LEelFi7Cswb+cPgqXsrx0C5C1vG6SekD4D
         gr/8xoPqA9tLz/rPjlIGh2F0A+SinQ/pFks/CqsUnY8hpUhMmyQ/TYzfMbZmkYel30kv
         jg+4ye2Y3Q9Sq0wtDp3l4IqXFnasSl5FsEg4xMdQyGPisgSn6sImrYDi/JZE65205ggq
         PThIHQCPULATPG32jGVWVw0xvvGKaQbr8o7zFUT1hp4fAcb4ROq9lt19Iyotc1ggTyK3
         TWrFu0SLj0ldFdXPqJ34b0qqONbEW55uXVx+beG7Y4v1MeBGc44nTcNtAclV5VUguQni
         2xvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788477430; x=1789082230;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rluHoATEsnIMMq1IqBSZ7wntCIrn2An5Y5Re4FkkfJs=;
        b=pIDHOpaZq9GsntVXLoYnlkVfjmcQuru6ssTAdLxRiN2xwn22JK4Ri3nnvuwGtihFA0
         pmxfSLwWhSQ01DcJm7ssQeOWPW0oHDiNHw/k11AUOSPB1x13PMk75TuBATIplPgsujaS
         br/Pq676dPklFZ6ee22W8kA6ZqxZQbsCSdrzmF0IBV0maAeB5jyrYhLCM3Gw2zPLwSDh
         4wllcebsAwpePdcXB7de0dVhQEOoxXqDNQ5FgcIBC1V42MT6pz+YSi+QLYJEXZGD5Dnw
         aIFPd0xXKjxb1NWX4x6Wijq0mkAZBcMLxnrH/sxgD0/uOMz87Hs6S2FO4Et995ZpZMrE
         orjA==
X-Gm-Message-State: AFuF++m1/izjDkHIt39ocAw2SpcqKB3n4gJGf8ynuxZvTj7Acv6B0Cl7
	VLed9xTzAcMoOocvB47CZ/rF1rttykQwDNm1LqKTQz69tn+VpJWwYgxRCgfSv1oJKJmBLOFfNC1
	dBuRFB0E=
X-Gm-Gg: AYBFou2IGNncXMHZrPiFCE1vwTJOYADsMiyV7z0srRZTMwMDE7iACOj37iymEYhjpGh
	2THEhAiYjGWgg8ltgfre/Px5Y9F9f09t2eOlWgpPBFwSt/NOSNQ84Kd9268FIK+UzGuwBPJ3yxp
	eh8xup56guv0bEXhWLK3LacgBaam3Q4Y+ykbl+z13UHhBkhgk3CIf6kVNXE2PjgV4u2mcCHCl3H
	KnC98RvLZO2Hgr1XAFHriMYHIlSQCE1pU0nwrdzydDXWR7Y0ih7wl18IFunaVqtqHWRuqZ2Myd+
	pWOUFUnkV0dkSjyQiK8SdUcrqdzdAOPKhVmAQNiJa+uFn3aB4DLvV2r2hfiykPOXLZA1Ogf6YJz
	Dh2taAh/Yv5UcHXIlbiTvNsCvxzlv+J6XMPp7+DD18I3Ajmtd73WlKMwyDVuocmPJv5FqsDxhbv
	35HRVRAU34pgqk95v+yITebzxJ8Qa2KLZgMBvj7LVEgWED/RfceBTZtxJJBX5o
X-Received: by 2002:a17:90b:5587:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-39b086549ccmr10434644a91.16.1788477430194;
        Thu, 03 Sep 2026 16:17:10 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm3324819c88.4.2026.09.03.16.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 16:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 16:17:08 -0700
Message-Id: <DL62C4AUIP38.MPEORUPGMCCG@nexthop.ai>
To: <sashiko-reviews@lists.linux.dev>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Cc: <robh@kernel.org>, <devicetree@vger.kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH v7 01/10] of: hold a reference on of_aliases during
 alias path resolution
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
 <20260831-nh-of-alias-overlay-v7-1-02754604805a@nexthop.ai>
 <20260901015522.D469D1F00A3D@smtp.kernel.org>
In-Reply-To: <20260901015522.D469D1F00A3D@smtp.kernel.org>

On Mon Aug 31, 2026 at 6:55 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Lockless load of the global `of_aliases` pointer followed by `of=
_node_get()` creates a Time-Of-Check to Time-Of-Use (TOCTOU) race condition=
 that can lead to a Use-After-Free.
> --
>
> commit 6d7d618928c35a7237faefa2eebe21725f461ed9
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
> of: hold a reference on of_aliases during alias path resolution
>    =20
> This commit updates of_find_node_opts_by_path() to hold a reference on th=
e
> of_aliases node during alias path resolution. It also adds validation for
> alias values, checking that they are non-empty, NUL-terminated absolute p=
aths.
>
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 378703dbc11f3..f7aa14d90e501 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
> [ ... ]
>> @@ -1002,16 +1004,21 @@ struct device_node *of_find_node_opts_by_path(co=
nst char *path, const char **opt
>>  			p =3D separator;
>>  		len =3D p - path;
>> =20
>> -		/* of_aliases must not be NULL */
>> -		if (!of_aliases)
>> +		aliases =3D of_node_get(of_aliases);
>
> [Severity: High]
> Does this lockless load of the global of_aliases pointer followed by
> of_node_get() create a Time-Of-Check to Time-Of-Use (TOCTOU) race conditi=
on?
>
> If a reader thread evaluating of_aliases in of_find_node_opts_by_path() i=
s
> preempted immediately after loading the pointer into a register, but befo=
re
> executing kobject_get() inside of_node_get(), a concurrent writer thread
> could completely remove the overlay containing the aliases node.
>
> The writer thread would drop all references and immediately free the node=
.
> When the reader thread resumes, it would pass the freed pointer to
> of_node_get(), which would dereference it to increment the refcount,
> resulting in a use-after-free.
>
>> +		if (!aliases)
>>  			return NULL;

In the strictest sense that window exists, but consider what it takes:
the reader must be preempted on the single instruction between the
pointer load and the refcount increment, and stay off-CPU while an
entire overlay teardown =E2=80=94 changeset revert, notifiers, and
of_changeset_destroy(), all under of_mutex =E2=80=94 starts and finishes. A=
nd
it only opens at all when /aliases itself is dynamically deleted,
i.e. the base DT booted without /aliases and the one overlay that
created it is reverted concurrently with an alias lookup. of_aliases
always holds a reference on the node it points to, the DETACH path
clears the pointer before dropping that reference, and the changeset
pins the node from the notifier until of_changeset_destroy() =E2=80=94 so
there is no point at which a reader can load a pointer to an
already-freed node.

Closing the residual gap means serializing the reader against the
final of_node_put(). v6 did exactly that (devtree_lock around the
load + get) and Rob asked for the plain of_node_get() instead:

  https://lore.kernel.org/r/<rob-v6-reply-msgid>

The remaining options were already explored in this series' history:
keeping the DETACH reference (v3) trips __of_changeset_entry_destroy()'s
refcount check and leaks the node every apply/revert cycle, and putting
node lifetimes under RCU is a tree-wide change far beyond this series.
I'm keeping Rob's requested form.

Thanks,
Abdurrahman
