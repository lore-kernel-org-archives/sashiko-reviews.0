Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794611288;
	b=WQ9In7rAIaQyfrGSElUX0zlE9g5ueEv6RoFfBp0LAfMqbmrd7GKdxrjLyKSOnIS2dtUc
	 9jmK20PAs2qc1sa/iOT4hW4ZWMZDOzYqjyXHH8NY/ZLbQYxjwpmY4bRkH5MOhRtmhw4IN
	 cnbTnyjqsE+cGxe4u+v7cnZB6rSayE7BSK5kdcl67HJz52To+DtEclfZDYZgKdH8oHp8+
	 9K38SP4d+fAdOJwSaTC1DCHUH9U3aGoT+Xv3IOv737zG67E3KrGxGq5pbHpPSoC+Tc2m/
	 vmx3dm+SC2jyKelvQoEHFIhWrQFxzftV7v0GGUOIbHKWisZHT8qs5Dcm3pRqTu5yPvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794611288;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 User-Agent:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=06kAyjF7TnFu0sIXC7RFGZg/0iQXbcsoCMf4v8Qle6Y=;
	b=tk9teHti+5FNJlXSPM7ywxrRCPeW0dAEPDhmsaCVrN7Lqpi9AJKdC7WmRI0o7YURHFBP
	 4prWk5hWvt9Gi+a2ldxWKKwtX+13eFleYQIOC6eNzGCx7yH6G6gTvNbIwlkObBbmQ3tdW
	 QZoJP3R4h6Rx1b47Y2PsIGdnc01nrPbjYU4qtduK4TS2MxrJuR6AhMWFeWnrnXPWM/Fj3
	 wMbSofX47l+jtsxyh4NiooAvajsyq3kFQd2iTa51Ogqzy2SJuCjyQOwzyJA5+KsDeib5o
	 mXJ5+QV7FMQBEmVsJxm4Axm2PB6AccqszMZfSodsQlBHpxncjMYfEE1/TJzeH4vzWIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jwwZoRZh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F67606A339
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 23:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jwwZoRZh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7A31F000C4;
	Fri, 13 Nov 2026 23:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794611287;
	bh=06kAyjF7TnFu0sIXC7RFGZg/0iQXbcsoCMf4v8Qle6Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=jwwZoRZhF5nsQFRrPE0EJgk/oVPJnNV37PiBSxtlxmq1EraKTGVX8YQFPbPx32BEj
	 qRjZDNql0Gyx6L5oSfZ2t/y/npMKeK7EOPQrZXqXPFmFL9J9kfL+Nc6xRihmxm/Inp
	 GFAGaNWwtXejLmIbTNPUcmKVR/IvmgfSB810L4xixkTaPn8Wdljnrk9x23adoKTZAi
	 bJ0BUFmhW9NRKyIn1n/r7lpGnSfgHh+0I4xZa4/nmjXWIBe6FWeCo2IaYs4jd272ex
	 LOvYp4f0obUUhpXCOT7rCG34YbJsPuZ0pyQIG+NATAiQJLzZj/wCyqzY+5ArVyjmek
	 fF8q9SkPBJ5dQ==
From: Roman Gushchin <roman@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,  Roman Gushchin
 <roman.gushchin@linux.dev>,  sashiko-reviews@lists.linux.dev,  David
 Hildenbrand <david@kernel.org>,  "Liam R. Howlett" <liam@infradead.org>,
  Vlastimil Babka <vbabka@kernel.org>,  Mike Rapoport <rppt@kernel.org>,
  Suren Baghdasaryan <surenb@google.com>,  Michal Hocko <mhocko@suse.com>,
  David Rientjes <rientjes@google.com>,  Shakeel Butt
 <shakeel.butt@linux.dev>,  Andrew Morton <akpm@linux-foundation.org>,
  Jann Horn <jannh@google.com>,  Pedro Falcato <pfalcato@suse.de>,  Matthew
 Wilcox <willy@infradead.org>,  Jan Kara <jack@suse.cz>,  Nhat Pham
 <nphamcs@gmail.com>,  Johannes Weiner <hannes@cmpxchg.org>,  Matthew Brost
 <matthew.brost@intel.com>,  Joshua Hahn <joshua.hahnjy@gmail.com>,
  Byungchul Park <byungchul@sk.com>,  Gregory Price <gourry@gourry.net>,
  Ying Huang <ying.huang@linux.alibaba.com>,  Alistair Popple
 <apopple@nvidia.com>,  Usama Arif <usama.arif@linux.dev>,  Kairui Song
 <kasong@tencent.com>,  Balbir Singh <balbirs@nvidia.com>,  =?utf-8?B?SsOp?=
 =?utf-8?B?csO0bWU=?= Glisse
 <jglisse@redhat.com>,  Kiryl Shutsemau <kas@kernel.org>,  Yu-cheng Yu
 <yu-cheng.yu@intel.com>,  Dave Hansen <dave.hansen@linux.intel.com>,
  Dennis Zhou <dennis@kernel.org>,  Tejun Heo <tj@kernel.org>,  Christoph
 Lameter <cl@gentwo.org>,  Peng Fan <peng.fan@nxp.com>,  Josef Bacik
 <jbacik@fb.com>,  Chris Mason <mason@kernel.org>,  linux-mm@kvack.org,
  Borislav Petkov <bp@alien8.de>,  Mark Brown <broonie@kernel.org>,  Dennis
 Zhou <dennisszhou@gmail.com>,  Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 10/13] mm/migrate_device: refuse to migrate shadow stacks
In-Reply-To: <F185BA4F-F26B-48EF-AB3C-848D72FA630D@nvidia.com>
References: <avYJ-CxBEpdO1Wmu@gremlin>
	<816E22E2-C7DD-4DD1-AAC9-F51F4D1ED71C@linux.dev>
	<avdveCV9uW1zwXXd@gremlin>
	<F185BA4F-F26B-48EF-AB3C-848D72FA630D@nvidia.com>
User-Agent: mu4e 1.12.12; emacs 31.1
Date: Fri, 13 Nov 2026 15:08:05 -0800
Message-ID: <87y0aw5nze.fsf@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Zi Yan <ziy@nvidia.com> writes:

> On 13 Nov 2026, at 15:17, Lorenzo Stoakes (ARM) wrote:
>
>> On Thu, Nov 12, 2026 at 02:53:44PM -0800, Roman Gushchin wrote:
>>>> On Nov 12, 2026, at 11:03=E2=80=AFAM, Lorenzo Stoakes (ARM) <ljs@kerne=
l.org> wrote:
>>>>
>>>> =EF=BB=BF+cc Roman
>>>>
>>>> Roman - see below - I was under the impression mm was not supposed to =
receive
>>>> 'unrelated to this patch but' reports? Did something change?
>>>
>>> Yes, sashiko started reporting pre-existing bugs again, but in a better=
 way:
>>> strictly once (per bug)
>>> only for the first non-rfc version
>>> somewhat related to the proposed patch
>>> not more than 1-2 per patch
>>> not exposing security-sensitive stuff this way
>>>
>>> Obviously the goal here it to increase the chances for the problem to b=
e fixed.
>>> It=E2=80=99s global, not mm-specific.
>>
>> (Sorry only just saw this!)
>>
>> Ah, I thought it was an mm opt-out.
>>
>> In general they're spawning a lot of AI sloppers to go off and send ever
>> more fixes and causing ever longer days for us, it's quite a noticeable
>> impact unfortunately.
>>
>> And often they're duplicative of already-sent fixes so you can see the
>> conundrum with this :)
>
> I wonder if there is a plan to make Sashiko identify duplicated fixes
> and send an email to point out the existing patches. So maintainers do
> not need to do that manually.

There is no plan, but I like this idea. Let me think how to implement it
better.

Thanks!
