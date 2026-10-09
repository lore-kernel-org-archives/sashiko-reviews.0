Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E4E3E40FF
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 08:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534773; cv=pass; b=qKzIs6WP6sj6kCwRqBV1Gw0gqAAzAFhwAwAg69oeea68izdRQAGkLZ35bBWMwSEhWWRydruItVAMhdla8mlh8941FBSF8JLNy0YCP6DVizDaW4NZuFHshSXIEG5BDdCAe/ar8LzPQPJMYEPrSaDtpgbi0w1ve3Y7PpUjsYvyzz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534773; c=relaxed/simple;
	bh=vzYaCJLBbyPc/qFbHDoIaROvXJy7u93JcRAj4Zb3tZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pkgzkZ0xC7EP4xF3Yhrrjhv44YY/frTq4x6eaXxQH+JMm+NAB5Rw3Z2gcRetVXQTsBOWnIzQdAk2yGAG7dDzKMuobh1HRG4d7ZL6IzKcddSgiHELo/45Egu0lB/5x4+vws0lKmZC5RxGNnXLlGkXCvX2xBb2ExJHW5rufL6vGQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQFqmjWu; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQFqmjWu"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e5378b281aso22994605ad.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 01:32:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791534772; cv=none;
        d=google.com; s=arc-20260327;
        b=TRLQTbfpcDt5P50Dn8fVUggYrTeZSW8qA5Pq4bkxHQMc0jv2F3ZtDMzUeTX1S8lMhc
         1LJOxTKWpkquVogmTX/b5VjSh3X1hv3KMTxddU+ZTDi3MwBnIxg+47mu7eB212HxD/Op
         aU9CXcjHBEp9GSR8rawcr7n3DVjdVa1UHlkzkNVvYaHeueM9KtiuIZRWPeJ/z7iQyU8K
         VpiUCinZvOuCatvyzZzicjlsufnBfIO3O4D+XB6OAmuiJpwwmIBZPI0WOsJwwhber30P
         UCTCrsGwrYvnaEtxtKMEo6un4O2xPH3VIKOqecRIBdrF6xUP6N3b1jE+UEq+qfgVaOxj
         njbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=46Rdn/x8iboRRS4C4ulQaCHznQ1vo5gREumVcF/3Tn0=;
        fh=WdZE3kgJeTebCBJ4NXeUoIjbXeb3faIbdq3aHEnJVzw=;
        b=gvR2bowF7hdWTjQMUo6LPOxbopSW3f958KtLb0C1maxV7FilCChmMdDJnX1fV64V/X
         Rm/GCzm93YIkJMlndPmUpvOU2Kilp/lhLx2/SXpwa3EGFj7tQmd2gl8GaYSCIzJL33y5
         laFLXbD/V9Ikx6zCujJI4omUJxvrZYIYanu3qH6hI7w1xXuPFeFTthNDOJISYpurxs0I
         yonvV+aPo53wf24hDmTs6jTdH4MgNLzogWnZCtFGl7OuJ33Mxaenv841ROWdnfF3PGlW
         TjEf89lLw9yT0MlWAuR0+/7U+sb6kJaz7TFStaWP2ignAoLT32Q5bz3C0M6n3l2ydHwp
         /Rsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791534772; x=1792139572; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46Rdn/x8iboRRS4C4ulQaCHznQ1vo5gREumVcF/3Tn0=;
        b=gQFqmjWuL8IfbWlNfu92VXgvHYtK1atbNjLSn2/q0dcFSsP13ubHCDpICXQH9lgEUo
         TMza7S5wnSbm8EVemFbqqrOkzQkMwgUNYQbK7CawsK3wzBrHvzk/GqooCfaYVAsvRk9o
         ho+nwEt8JYtuTI+vNXt389NZsXSxZpoYUCNGZ23D9ku67hqFyKFUFBUcJUcHjT7j4plg
         ZN7bWpMlA01B3tBiQ3q8D/ATTfteFPh6zEtrOnNL8FdBEeFyWQKJx3R9nxv9YSC6Ipt7
         6FTYbWKhPnVrI4qQGjxsCI29tABR2fXYw8NNkDqUgoarhtcQq+BDWJKFrJJ+ixzO+RLO
         TiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534772; x=1792139572;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=46Rdn/x8iboRRS4C4ulQaCHznQ1vo5gREumVcF/3Tn0=;
        b=Cfjji1F3HogmrRx2jUgwD9/eDY8bUgIuX+TibknNnoesZ3pvUgoE5ojo3smGl5vUvK
         bd7YEW3gXw/9Fr764PISRYEvqbGhBVL2luasU93E4orjyaFdTMOOYzL/GDLJAz+BGxlr
         uWUxg4RZ+jTMSZuy65IXlNkNI/Yy7JKjyFdqAEujYNECCj649hky9lUT3WlZQpKxrhiX
         nUIi6ooi2VldFpvWyh0S5/TVcvPcSTpejXLH7ASKKRDq2FqDhtz6XwZMOZvd+4CjGHyH
         NPvR8FCQYNzE5lXcdvZ0I7QBM0lyt57qAMJPRWGgVnA1CYOlpNhwmRXQJxBkx0MbV47P
         japQ==
X-Gm-Message-State: AFq9FYJB4s9mCHe7JqQ/yySWGpe8TJPF9X1TPFbOfswhHhKBTYVNhKjJ
	z6AComq/JMVclAtNbGepTTp+phEQ5XtOuTTg5oXChn6tD9fGLuhe1sjCwlOflkm5WuAMzNmGmL3
	sggm2jzXJKxhwzy7TKByQB+SYjSO0ySJuSiEf
X-Gm-Gg: AYBFou35fFc4C4Nv2NXjmhF1juaBa+1Ca4RJnLHpkeORSA3P9e1AxUUxKCPOJOknZsW
	H8yiua26fxw5M9qA0171sN8WGkP+cN9RawGj88bBLguac5676V7uq/YxOPilr7sqhhftMy6fVkD
	2WyWlSsDnz4T0ecJaH5LUnhrICSgmS+wE2LRLj00TkbMf8l950tt6OkCI/zR/yI1esTz4SqP0z+
	IbNfsobAuADWv28QgnBpvpFw1GDCgc0GzuZUVXW7L/J23RRY/YbilHi9alMc/JHcVcAbgYvm9wx
	0IyhJKPCWH5u8K5JlTDL3fBUueYrKdqofsT2tCiw4Njx692nSMOfPOCMeiGyynEdCGzwX7BIeAA
	jC8pV0kTSwtZ8T7I0Rpm43SeiDZ/6wDxdE38sWpsYbZcgrYyG0KEpqKDqJQQQlSo/L6eXC+P7AS
	K5ig==
X-Received: by 2002:a17:903:950:b0:2e8:3e5d:b2b7 with SMTP id
 d9443c01a7336-2e842cd96d6mr10150435ad.40.1791534771859; Fri, 09 Oct 2026
 01:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007104915.507801-1-phucduc.bui@gmail.com>
 <sashiko-outbox-162904@kernel.org> <CAABR9nFAk9-PDsb7CDofeKp3DOHH4LLNMJRtjUkP4CeV0f=01A@mail.gmail.com>
In-Reply-To: <CAABR9nFAk9-PDsb7CDofeKp3DOHH4LLNMJRtjUkP4CeV0f=01A@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 9 Oct 2026 15:32:40 +0700
X-Gm-Features: AclHuK8XN9K-ogLHtFEL9lYrpTHkwKGuJrAfKNgnjUZ1GrmHQNgZd9i-U2aNpMk
Message-ID: <CAABR9nG_Q2+cEBubvZAvqJM-voO6Q-GxPTwYOSi-U=C4YGu0zA@mail.gmail.com>
Subject: Re: [PATCH] leds: lm3532: propagate enable GPIO errors
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > [Severity: Medium]
> > Will this change result in unconditional error logging during deferred probes
> > anyway?
> >
> > When devm_gpiod_get_optional() returns a deferred probe error, dev_err_probe()
> > correctly suppresses the log message here. However, the caller lm3532_probe()
> > does not use dev_err_probe() for its return check:
> >
> > lm3532_probe() {
> >     ...
> >     ret = lm3532_parse_node(drvdata);
> >     if (ret) {
> >         dev_err(&client->dev, "Failed to parse node\n");
> >         return ret;
> >     }
> >     ...
> > }
>
> I will also add this code to the current patch.
>
> --------------------------------------------------------------------------------------------
> ret = lm3532_parse_node(drvdata);
> if (ret)
>         return dev_err_probe(&client->dev, ret, "Failed to parse node\n");
> ---------------------------------------------------------------------------------------------

After looking at the error handling in lm3532_parse_node(),
I think it would be better to log errors there and return the error
directly from lm3532_probe(),
avoiding duplicate error messages.
I'll update the patch accordingly.
