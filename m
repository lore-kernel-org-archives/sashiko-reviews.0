Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392698;
	b=UrM5OAiSfaDJWrgw1LjPAYuTJ/neyLBYM2yCB8i05TwnF8oY11I1IrFviYbxk3tthOAC
	 HyzFHH1Xx5uK8G/RSnlbCyZ5M94r1KauKJGMJWdrL70O4grKI6h8sZ8bBNDD4rb5WXcDy
	 CLAlUHwguA2UuRbJlZS2Ofxw7GtkB5RGavzlM+edgByhza2sQHBBrO6+VF2e3HNCcIpJY
	 MYTiF4QWaezT0ccfSdfvvKpMQCQ/EnNDUxvV4yTv9jGakFXK6BDOTyTxHC2H6tUuWN+4O
	 K0ErV8pWyBtRTF2sx75UcLGmJg7WXuxRCJ0Olq1+YaDykw1KY6aH80eKT82icWwBhDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392698;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JnH6E3m3OytwHtdIb9v7wOGuBamv9Irg/1uvzHNiYxQ=;
	b=J/zwPnU7/jhn+cuZ5N/DbMJtxcWWRF1mhPjYtisLlEC2cwyijOoTIcgyour2hmg+B1U+
	 oTvEl/5++2fIuJGj7uzv5UqK3yf1OqWHyPkwYr1bPbLeG37SReNdewtrX3PJo9C/jThlp
	 /SA/RpNceEbG0UOdSWP51gzBhkBI9HJJ7LD6B2EaRL50PgrX3uS15aI0RyGsJQSrddGI2
	 dKdfWzgZQspGQEk37eGiG7qa02Ft314moNW6fWCkFA5f+cz2pbxroR0Tku9/wp+DEniWL
	 GzmOYTd/43+W26k6d18OXXlvVAJNGm//d0HmhfI5DBy5nW5DDRlGGLGHIrrlC04M2ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NQHo0OpC;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C56F606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 10:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C56F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NQHo0OpC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4FF51576;
	Wed, 11 Nov 2026 02:24:54 -0800 (PST)
Received: from [10.57.63.24] (unknown [10.57.63.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5293A3F632;
	Wed, 11 Nov 2026 02:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794392697; bh=fS7+dm1lVrR3kORF0oVfw8gO0FZtBp9Mzni64/2uajE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NQHo0OpCNlDTSyVwt9AskltMoLOC5DmzwE0FLofcyuQKXSh1OQ1LRblNqRoVCwt5D
	 47za/dhQFqhiljNKutssaQNItZ5vVOwNbXueiF1wf174d18hrJ0Dw+pX/osNlH1KtV
	 wvmVCbGhtttzbT1gy+aQN1BIJ3boc+tDGe7M8IOI=
Message-ID: <0dcf6c71-9584-48c8-86ba-43b9bda0d16f@arm.com>
Date: Wed, 11 Nov 2026 11:24:44 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v10 01/22] mm: Introduce kpkeys
To: sashiko-reviews@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Ard Biesheuvel <ardb+git@google.com>, Andy Lutomirski <luto@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>,
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Maxwell Bland <mbland@motorola.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 =?UTF-8?Q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org, x86@kernel.org,
 Ira Weiny <iweiny@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
 <20261109-kpkeys-v10-1-aa6c4d9603bc@arm.com>
 <sashiko-outbox-207315@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <sashiko-outbox-207315@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2026 17:02, sashiko-bot@kernel.org wrote:
>> [...]
>>
>> +/**
>> + * KPKEYS_GUARD_COND() - helper to define a guard type that conditionally
>> + *                       switches to a given kpkeys context
>> + * @name: the name of the guard type
>> + * @ctx: the kpkeys context to switch to
>> + * @cond: an expression that is evaluated as condition
>> + *
>> + * Define a guard type that switches to @ctx if @cond evaluates to true,
>> + * and does nothing otherwise.
>> + */
>> +#define KPKEYS_GUARD_COND(name, ctx, cond)				\
>> +	__DEFINE_CLASS_IS_CONDITIONAL(name, false);			\
>> +	DEFINE_CLASS(name, struct kpkeys_state,				\
>> +		     kpkeys_leave_context(&_T),				\
>> +		     (cond) ? kpkeys_enter_context(ctx) :		\
>> +			      (struct kpkeys_state) {}, void);		\
>> +	static inline							\
>> +	void *class_##name##_lock_ptr(struct kpkeys_state *_T)		\
>> +	{ return _T; }
> [Severity: Low]
> Could KPKEYS_GUARD_NOOP() and KPKEYS_GUARD_COND() use
> DEFINE_CLASS_IS_UNCONDITIONAL(name) after DEFINE_CLASS() instead of
> open-coding __DEFINE_CLASS_IS_CONDITIONAL() and class_##name##_lock_ptr()?
> include/linux/cleanup.h already provides DEFINE_CLASS_IS_UNCONDITIONAL() for
> this purpose, avoiding reliance on internal cleanup.h helpers.

Agreed, that's the helper I was looking for but it didn't exist when I
first wrote this code!

- Kevin
