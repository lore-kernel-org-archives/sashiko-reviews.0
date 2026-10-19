Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2679B25B098
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 04:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792382490; cv=none; b=qbEhln4/s+a2ZP5iN93UNtmfvD807YSlYI8NhpYOekPEuu1+MdJ9GofZ3PRVU9nNtpVbSTdxUKoFikp2/foN7PQ9pfKdz75HWX1hHyhc5O/IhW4JQhpnXMbVFD86zj3ZmlevZTeMApK7nPbR7CBMjrdJiTr92oFFMLabM0JER9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792382490; c=relaxed/simple;
	bh=8CrE91J0fGYXsXVw280TKZ+FIOilDiXTUNJAh1UNvA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEJqYSzSk75bXfmy5KwuYyjgsdAJ51f7Nta9A+6gRAwnnuBXY4seAsUWwDm8PfHeRhuCT0kSYG8+aYkiAoVlxrCBg4OMAV5snFibzB+sQqEIMJ4TtRSpQgcTec0CIbDmjUuVlG/gzKSABrGrLXVmokC1XRmtT092BYamY53n99Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UjBEsSn1; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UjBEsSn1"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so170183a91.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 18 Oct 2026 21:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792382488; x=1792987288; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j5Us+RzdYAbnpmQtT3TAtyX+ezvC5k/Vrz+te4DAOOo=;
        b=UjBEsSn1ix30Ek/K8PPy5RYRoXwksEHDs+MniJtIvwB3uqJIY4eLUEA/7GyYXpqhw4
         HoR1qD2eQDeRaC7c4sJlmjzX3jvxAjHwAZE+xuSfbr6wyrTX5Zo3Gft7JXIjtEZxfNxp
         FqFvi+nIb4Lv9XDTQessKpdJg+QG/ddhBYSLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792382488; x=1792987288;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5Us+RzdYAbnpmQtT3TAtyX+ezvC5k/Vrz+te4DAOOo=;
        b=N6aQvh03t6SttdiLrSz5GhPmOFoJZ3qPBtVd550vNiO5yiei7elBrtCfwCRwLZ8/S2
         i+qEUZ8OaKML+W2oq5szlmMPwQ3Ln5rVJ3IvrQfvryq7GU4XkJTg1ct7Ok3oyLcxfer8
         xrj9LHb6e1ayWWaCBcAhkATcHfrOZj5wsd0V/XNyh3mKA3YLnkFQbnTawptlLCktvEj8
         pZ79BtJRHBZoXcJa0IqfvuMfvINxREoM1Rn9+OByJY9y5NH6qwiyfwLgUFR2B/MkxHVO
         IDtqODVjyHRta5Mu5Lp654NgGmrs1q1Of0gsk5mx0zpENhpx+F6o4DLSbJji5jepUWDe
         n4dg==
X-Gm-Message-State: AFq9FYK8he8IS9mHJWeil4qbIvQusXw8Uzu/6MJlgqAL84L7QwyE0ySQ
	Ks/jJCotq1pFRT8UVB9J3sDNhabDf2D3tSejwmp/gFJNbWOdCaPN1NZ28Nd+Xt66DJdFh0tYcVp
	MZNg=
X-Gm-Gg: AYBFou0PefKW5WAyHXiV79mboLdTdye0xbahfw9fRSyZoWVXatnwqWC+8qVpdZgygTm
	21qlWXq3kS41H6LVmrXx9V8DS5GNegYo+Ig2kaVdE3Vqt9eor/TF8IfUU/yCf3N86qT+OTa+Q5f
	EdDz/kOGKY7CypTDHcXPSzWV0NlOKB0fVmEuMEwkCENl+R8+jJ/bZcHefmqPXiR+7fBkhY3zYia
	3hDhtauKHeYyx+GuU2yRWTJSX42bu/yb3jFS1ywxky0MjzyP+SK7+/82SblheLm/NpDSzD9xzXJ
	DEBIpZoZH+f0YXRo9+ArmoGFjatWR9boOZm2v2hpYm0CMVVtQ+tmCzBOd2VNA0F3KKu6yaIY4ir
	U7KubowjMy1m/DtjrQlClB9JOnt1C80m46U8T32jI/O05/YYKyeZ7BD2aNyfXlKkuVqRbt6scsA
	AGv1zp3TucJz9Txu/ATqw6D3E9r5OoOXl9r91HLJOXVcgZCRuVP99Bin3uP6la+u5vgcaOFFhYR
	GOB6hRZTwUglN3I1laIyagawiKjNmZn5I36Rw==
X-Received: by 2002:a17:90a:5184:b0:3ad:13fe:41ba with SMTP id 98e67ed59e1d1-3ad13fe424amr1909945a91.52.1792382488360;
        Sun, 18 Oct 2026 21:01:28 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:7b3d:f4ff:823:5963])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm7232815a91.4.2026.10.18.21.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 21:01:27 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:01:23 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: sashiko-reviews@lists.linux.dev
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Brian Geffon <bgeffon@google.com>, 
	Barry Song <baohua@kernel.org>, Bo Zhang <zhangbo0325@gmail.com>, 
	Minchan Kim <minchan@kernel.org>, Richard Chang <richardycc@google.com>, linux-mm@kvack.org
Subject: Re: [PATCH v5 12/13] zram: borrow idle decompression streams in
 exclusive mode
Message-ID: <atWV7iJpJv0UXXCQ@google.com>
References: <20261018035125.3120704-1-senozhatsky@chromium.org>
 <20261018035125.3120704-13-senozhatsky@chromium.org>
 <sashiko-outbox-176604@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-176604@kernel.org>

On (26/10/19 03:53), sashiko-bot@kernel.org wrote:
[..]
> > +static struct zcomp_dstrm *zcomp_dstrm_excl_tryget(struct zcomp *comp)
> > +{
> > +	struct zcomp_dstrm *zstrm;
> > +	unsigned int cpu;
> > +
> > +	/* Best-effort start CPU hint; migration during the scan is fine */
> > +	for_each_online_cpu_wrap(cpu, raw_smp_processor_id()) {
> > +		zstrm = per_cpu_ptr(comp->dstream, cpu);
> > +		if (zcomp_dstrm_excl_trylock(zstrm))
> > +			return zstrm;
> > +	}
> > +	return NULL;
> > +}
> 
> [Severity: High]
> Does passing raw_smp_processor_id() directly as the start argument to
> for_each_online_cpu_wrap() in zcomp_dstrm_excl_tryget() break the loop
> termination logic when the task migrates during the scan?

I guess you are right.  I'll fixup in v6.
